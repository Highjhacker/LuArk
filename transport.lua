local API = require('api')
local class = require('middleclass')

local api = API()
local Transport = class('Transport')


function Transport:get_peers()
  -- Get a list of peers.
  return api:get("peer/list")
end


function Transport:get_common_blocks(ids)
  -- Get a list of blocks by ids.
  -- :param ids: List of block ids.
  return api:get("peer/blocks/common", {ids=ids}) -- ou juste ids ?
end


function Transport:get_blocks(address)
  -- Get all blocks.
  -- :param address: Valid Ark address.
  return api:get("peer/blocks", {address=address})
end


function Transport:get_block(address)
  -- Get a single block.
  -- :param address: Valid Ark address.
  return api:get("peer/block", {address=address})
end


function Transport:get_transactions()
  -- Get a list of transactions.
  return api:get("peer/transactions")
end


function Transport:post_transaction()
  -- Post a new transaction.
  return "Not implemented yet !"
end


function Transport:get_transactions_from_ids(ids)
  -- Get a list of transactions by ids.
  -- :param ids: A list of valid Transaction ids.
  return api:get("peer/transactionsFromIds", {ids=ids})
end


function Transport:get_height()
  -- Get the blockchain height.
  return api:get("peer/height")
end


function Transport:get_status()
  -- Get the blockchain status.
  return api:get("peer/status")
end

return Transport