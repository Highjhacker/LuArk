local API = require('api')
local class = require('middleclass')

local api = API()
local loader = require('loader')

local json = require('json')

describe('loader()', function()

  describe('when getting the status', function()
      it('should return true', function()
          resp = loader:get_status()
          local toJson = json.decode(resp)
          assert.same(toJson["success"], true)
      end)
  end)

  describe('when getting the sync status', function()
      it('should return true', function()
          resp = loader:get_sync()
          local toJson = json.decode(resp)
          assert.same(toJson["success"], true)
      end)
  end)

  describe('when autoconfiguring the client loader', function()
      it('should return true', function()
          resp = loader:autoconfigure()
          local toJson = json.decode(resp)
          assert.same(toJson["success"], true)
      end)
  end)
end)
