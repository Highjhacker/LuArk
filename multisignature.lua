local API = require('api')
local class = require('middleclass')
local TransactionBuilder = require('transaction_builder')

local api = API()
local MultiSignature = class('MultiSignature')


function MultiSignature:get_pending(publicKey)
  -- Get pending multi signatures transactions.
  return api:get("api/multisignatures/pending", {publicKey=publicKey})
end

function MultiSignature:get_accounts(publicKey)
  -- 
  return api:get("api/multisignatures/accounts", {publicKey=publicKey})
end

function MultiSignature:create(secret, second_secret, keysgroup, lifetime, min)
  local tx = TransactionBuilder:create_multisignature(
    secret,
    second_secret,
    keysgroup,
    lifetime,
    min
  )

  local transactions = {}
  transactions[1] = tx:to_params()
  return api:post('peer/transactions', {transactions=transactions})
end

return MultiSignature