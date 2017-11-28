local API = require('api')
local class = require('middleclass')

local api = API()
local Block = class('Block')


function Block:get_block(id)
  -- Get block by id.
  -- :param id: Valid Block ID.
  return api:get("api/blocks/get", {id=id})
end


function Block:get_blocks(...)
  -- Get all blocks.
  -- :param ...: Optionnal parameters. limit, orderBy, offset, generatorPublicKey, totalAmount, totalFee,
  -- reward, previousBlock, height
  local parameters = ...
  return api:get("api/blocks", parameters)
end


function Block:get_height()
  -- Get the blockchain height.
  return api:get("api/blocks/getHeight")
end


function Block:get_epoch()
  -- Get the blockchain epoch.
  return api:get("api/blocks/getEpoch")
end


function Block:get_nethash()
  -- Get the blockchain nethash.
  return api:get("api/blocks/getNetHash")
end


function Block:get_fee()
  -- Get the blockchain fee for sending normal transactions.
  return api:get("api/blocks/getFee")
end


function Block:get_fees()
  -- Get the network fees.
  return api:get("api/blocks/getFees")
end


function Block:get_milestone()
  -- Get the blockchain milestone.
  return api:get("api/blocks/getMilestone")
end


function Block:get_reward()
  -- Get the blockchain reward.
  return api:get("api/blocks/getReward")
end


function Block:get_supply()
  -- Get the blockchain supply.
  return api:get("api/blocks/getSupply")
end


function Block:get_status()
  -- Get the blockchain status.
  return api:get("api/blocks/getStatus")
end

return Block