local API = require('api')
local class = require('middleclass')

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

return MultiSignature