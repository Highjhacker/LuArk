local API = require('api')
local class = require('middleclass')

local api = API()
local transport = require('transport')

local json = require('json')

describe('transport()', function()

  describe('when getting a list of peers', function()
      it('should return true', function()
          resp = transport:get_peers()
          local toJson = json.decode(resp)
          assert.same(toJson["success"], true)
      end)
  end)

  describe('when getting a list of blocks by ids', function()
      it('should return true', function()
          resp = transport:get_common_blocks({"5807533976636630922", "7191952529633383827"})
          local toJson = json.decode(resp)
          assert.same(toJson["success"], true)
      end)
  end)

  describe('when getting all blocks', function()
      it('should return true', function()
          resp = transport:get_blocks("AJbmGnDAx9y91MQCDApyaqZhn6fBvYX9iJ")
          local toJson = json.decode(resp)
          assert.same(toJson["success"], true)
      end)
  end)

  --[[ Doesn't work either on Swagger app
  describe('when getting a single block', function()
      it('should return true', function()
          resp = transport:get_block("AJbmGnDAx9y91MQCDApyaqZhn6fBvYX9iJ")
          local toJson = json.decode(resp)
          assert.same(toJson["success"], true)
      end)
  end)
  --]]

  describe('when getting a list of transactions', function()
      it('should return true', function()
          resp = transport:get_transactions("AJbmGnDAx9y91MQCDApyaqZhn6fBvYX9iJ")
          local toJson = json.decode(resp)
          assert.same(toJson["success"], true)
      end)
  end)

  describe('when getting a list of transactions by ids', function()
      it('should return true', function()
          resp = transport:get_transactions_from_ids("e9f1ff96ccaf9ebcadb0e1c0827c606a71a88c258c6a3ec1a880be000996dd25")
          local toJson = json.decode(resp)
          assert.same(toJson["success"], true)
      end)
  end)

  describe('when getting the blockchain height', function()
      it('should return true', function()
          resp = transport:get_height()
          local toJson = json.decode(resp)
          assert.same(toJson["success"], true)
      end)
  end)

  describe('when getting the blockchain status', function()
      it('should return true', function()
          resp = transport:get_status()
          local toJson = json.decode(resp)
          assert.same(toJson["success"], true)
      end)
  end)


end)
