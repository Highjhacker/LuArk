local API = require('api')
local class = require('middleclass')
local inspect = require('inspect')

local api = API()
local Delegate = class('Delegate')

local Utils = require('utils')
local utils = Utils()

function Delegate:get_delegates_count(address)
  -- Get the count of delegates.
  -- :param address: Valid Ark address.
  return api:get("api/delegates/count", {address=address})
end


function Delegate:search_delegates(query, ...)
  -- Search for specific delegates.
  -- :param query: The name we want to search.
  -- :param ...: Optionnal parameters. limit.
  local parameters = utils:tableMerge(query, ...)
  response = api:get("api/delegates/search", parameters)
  return response
end


function Delegate:get_voters(publicKey)
  -- Get a list of voters for a delegate.
  -- :param publicKey: Valid Ark publicKey.
  return api:get("api/delegates/voters", {publicKey=publicKey})
end


function Delegate:get_delegate(username)
  -- Get a single delegate.
  -- :param username: The delegate's name.
  return api:get("api/delegates/get", {username=username})
end


function Delegate:get_delegate_publickey(publicKey)
  -- Get a single delegate.
  -- :param username: Valid Ark publicKey.
  return api:get("api/delegates/get", {publicKey=publicKey})
end


function Delegate:get_delegates(...)
  -- Get all delegates.
  -- :param ...: Optionnal parameters. orderBy, limit, offset.
  local parameters = ...
  return api:get("api/delegates", parameters)
end


function Delegate:get_delegate_fee(address)
  -- Get the delegate fee.
  -- :param address: Valid Ark address.
  return api:get("api/delegates/fee", {address=address})
end


function Delegate:get_forged_by_account(generatorPublicKey)
  -- Get the amount of Arks forged by an account.
  -- :param generatorPublicKey: Valid Ark generatorPublicKey.
  return api:get("api/delegates/forging/getForgedByAccount", {generatorPublicKey=generatorPublicKey})
end


function Delegate:get_next_forgers(address)
  -- Get the next forgers.
  -- :param address: Valid Ark address.
  return api:get("api/delegates/getNextForgers", {address=address})
end

return Delegate