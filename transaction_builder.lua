local class = require('middleclass')
local basexx = require('basexx')
local EcKey = require('ec_key')
local Utils = require('utils')
local trezor_crypto = require('trezor_crypto')
local struct = require('struct')

local Transaction = class('Transaction')

Transaction.static.TYPE = {
	TRANSFER = 0,
	SECOND_SIGNATURE = 1,
	DELEGATE = 2,
	VOTE = 3,
	MULTISIGNATURE = 4
}
Transaction.static.FEE = {
	TRANSFER = 10000000,
	SECOND_SIGNATURE = 500000000,
	DELEGATE = 2500000000,
	VOTE = 100000000,
	MULTISIGNATURE_BASE = 500000000
}

-- 2017-03-21 13:00:00 UTC
Transaction.static.ARK_EPOCH = 1490101200

function Transaction:initialize(
	type,
	fee,
	sender_public_key,
	recipient_id,
	amount,
	vendor_field,
	asset
)
	self.type = type
	self.fee = fee
	self.sender_public_key = sender_public_key
	self.recipient_id = recipient_id
	self.amount = amount
	self.vendor_field = vendor_field
	self.asset = asset or {}
	self.timestamp = os.time() - Transaction.ARK_EPOCH
end

function Transaction:to_params()
	local ret_val = {
		type=self.type,
		amount=self.amount,
		fee=self.fee,
		timestamp=self.timestamp,
		id=self.id,
		signature=self.signature,
		recipientId=self.recipient_id,
		vendorField=self.vendor_field,
		senderPublicKey=Utils:decodeBase16(self.sender_public_key)
	}

	if self.sign_signature then
		ret_val.signSignature = self.sign_signature
	end

	if self.type == Transaction.TYPE.VOTE or  self.type == Transaction.TYPE.MULTISIGNATURE then
		ret_val.asset = self.asset
	elseif self.type == Transaction.TYPE.SECOND_SIGNATURE then
		ret_val.asset = {
			signature={publicKey=Utils:decodeBase16(self.asset.signature.public_key)}
		}
	elseif self.type == Transaction.TYPE.DELEGATE then
		ret_val.asset = {
			delegate={
				username=self.asset.delegate.username,
				publicKey=Utils:decodeBase16(self.asset.delegate.public_key)
			}
		}
	end

	return ret_val
end

function Transaction:to_bytes(skip_signature, skip_second_signature)
	local type = struct.pack('b', self.type)
	local timestamp = struct.pack('I4', self.timestamp)
	local sender_public_key = basexx.from_hex(
		Utils:decodeBase16(self.sender_public_key)
	)

	local recipient_id
	if self.recipient_id then
		recipient_id = Utils:decode58Check(self.recipient_id)
	else
		recipient_id = struct.pack(string.rep('x', 21))
	end

	local vendor_field
	if self.vendor_field then
		vendor_field = self.vendor_field
		if #self.vendor_field < 64 then
			vendor_field = vendor_field .. string.rep(struct.pack('x'), 64 - #self.vendor_field)
		end
	else
		vendor_field = struct.pack(string.rep('x', 64))
	end

	local amount = struct.pack('I8', self.amount)
	local fee = struct.pack('I8', self.fee)

	local asset_info = ''
	if self.type == Transaction.TYPE.SECOND_SIGNATURE then
		asset_info = self.asset.signature.public_key
	elseif self.type == Transaction.TYPE.DELEGATE then
		asset_info = self.asset.delegate.username
	elseif self.type == Transaction.TYPE.VOTE then
		asset_info = table.concat(self.asset.votes, ',')
	elseif self.type == Transaction.TYPE.MULTISIGNATURE then
		local ms_asset = self.asset.multisignature
		asset_info = asset_info .. struct.pack('i1', ms_asset.min)
		asset_info = asset_info .. struct.pack('i1', ms_asset.lifetime)
		asset_info = asset_info .. table.concat(ms_asset.keysgroup, '')
	end

	local signature = ''
	if not skip_signature and self.signature then
		signature = basexx.from_hex(self.signature)
	end

	local second_signature = ''
	if not skip_second_signature and self.sign_signature then
		second_signature = basexx.from_hex(self.sign_signature)
	end

	return type .. timestamp .. sender_public_key .. recipient_id ..
	vendor_field ..	amount .. fee .. asset_info .. signature .. second_signature
end

function Transaction:sign_and_create_id(secret, second_secret)
	local transaction_bytes = self:to_bytes(true, true)
	local raw_signature = trezor_crypto.ecdsa_sign(secret, basexx.to_hex(transaction_bytes))
	self.signature = string.lower(basexx.to_hex(raw_signature))

	if second_secret then
		transaction_bytes = self:to_bytes(false, true)
		local raw_sign_signature = trezor_crypto.ecdsa_sign(second_secret, basexx.to_hex(transaction_bytes))
		self.sign_signature = string.lower(basexx.to_hex(raw_sign_signature))
	end

	local raw_id = trezor_crypto.sha256(basexx.to_hex(self:to_bytes(false, false)))
	self.id = string.lower(basexx.to_hex(raw_id))
end

local TransactionBuilder = class('TransactionBuilder')

function TransactionBuilder:create_transfer(
	recipient_id,
	amount,
	vendor_field,
	secret,
	second_secret)
	local transaction = Transaction:new(
		Transaction.TYPE.TRANSFER,
		Transaction.FEE.TRANSFER,
		EcKey:secret_to_public_key(secret),
		recipient_id,
		amount,
		vendor_field
	)

	transaction:sign_and_create_id(secret, second_secret)
	return transaction
end

function TransactionBuilder:create_second_signature(second_secret, first_secret)
	local transaction = Transaction:new(
		Transaction.TYPE.SECOND_SIGNATURE,
		Transaction.FEE.SECOND_SIGNATURE,
		EcKey:secret_to_public_key(first_secret),
		nil,
		0,
		nil,
		{signature = {public_key = EcKey:secret_to_public_key(second_secret)}}
	)
	transaction:sign_and_create_id(first_secret)
	return transaction
end

function TransactionBuilder:create_vote(votes, secret, second_secret, network_address)
	network_address = network_address or 0x17
	local public_key = EcKey:secret_to_public_key(secret)
	local transaction = Transaction:new(
		Transaction.TYPE.VOTE,
		Transaction.FEE.VOTE,
		public_key,
		EcKey:public_key_to_address(public_key, network_address),
		0,
		nil,
		{votes = votes}
	)
	transaction:sign_and_create_id(secret, second_secret)
	return transaction
end

function TransactionBuilder:create_delegate(username, secret, second_secret)
	local asset = {
		delegate = {
			username = username,
			public_key = EcKey:secret_to_public_key(secret)
		}
	}
	local transaction = Transaction:new(
		Transaction.TYPE.DELEGATE,
		Transaction.FEE.DELEGATE,
		EcKey:secret_to_public_key(secret),
		nil,
		0,
		nil,
		asset
	)
	transaction:sign_and_create_id(secret, second_secret)
	return transaction
end

function TransactionBuilder:create_multisignature(
	secret,
	second_secret,
	keysgroup,
	lifetime,
	min
)
	local asset = {
		multisignature = {
			min = min,
			lifetime = lifetime,
			keysgroup = keysgroup
		}
	}
	local transaction = Transaction:new(
		Transaction.TYPE.MULTISIGNATURE,
		Transaction.FEE.MULTISIGNATURE_BASE * (#keysgroup + 1),
		EcKey:secret_to_public_key(secret),
		nil,
		0,
		nil,
		asset
	)
	transaction:sign_and_create_id(secret, second_secret)
	return transaction
end

return TransactionBuilder