local API = require('api')
local class = require('middleclass')

local api = API()
local Signature = class('Signature')

function Signature:get_signature_fee()
  -- Get the fee for a signature.
  return api:get("api/signatures/fee")
end


function Signature:get_address_signature_fee(address)
  -- Get the fee for a signature on a specified address.
  -- :param address: Valid Ark address.
  return api:get("api/signatures/fee", {address=address})
end

return Signature