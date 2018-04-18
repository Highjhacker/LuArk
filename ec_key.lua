local class = require('middleclass')
local trezor_crypto = require('trezor_crypto')
local basexx = require('basexx')
local Utils = require('utils')
local struct = require('struct')


local EcKey = class('EcKey')

function EcKey:secret_to_public_key(secret)
	return trezor_crypto.secret_to_public_key(secret)
end

function EcKey:public_key_to_address(public_key, network_address)
	local network_byte = struct.pack('b', network_address or 0x17)
	local hashed_pub_key = trezor_crypto.ripemd160(
		string.lower(basexx.to_hex(public_key))
	)
	local payload = network_byte .. hashed_pub_key
	return Utils:encode58Check(payload)
end

return EcKey
