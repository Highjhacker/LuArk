local API = require('api')
local class = require('middleclass')

local api = API()
local Account = class('Account')

function Account:get_balance(address)
  -- Get the balance of an account.
  -- :param address: Valid Ark address.
  return api:get("api/accounts/getBalance", {address=address})
end


function Account:get_public_key(address)
  -- Get the public key of an account.
  -- :param address: Valid Ark address.
  return api:get("api/accounts/getPublicKey", {address=address})
end


function Account:get_delegate_fee()
  -- Get the delegate fee of an account.
  return api:get("api/accounts/delegates/fee")
end


function Account:get_delegates(address, ...)
  -- Get the delegates of an account.
  -- :param address: Valid Ark address.
  -- : param ...: Optionnal parameters. orderBy, limit, offset.
  local parameters = ...
  return api:get("api/accounts/delegates", {address=address}, parameters)
end


function Account:get_accounts(address)
  -- Get account information of an address.
  -- :param address: Valid Ark address.
  return api:get("api/accounts", {address=address})
end


function Account:get_top_accounts(...)
  -- Get a list of top account
  -- :param ...: Optionnal parameters. limit, offset.
  local parameters = ...
  return api:get("api/accounts/top", parameters)
end

return Account