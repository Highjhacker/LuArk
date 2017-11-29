local API = require('api')
local class = require('middleclass')

local api = API()
local peer = require('peer')

local json = require('json')

describe('peer()', function()

  describe('when getting a single peer', function()
      it('should return true', function()
          resp = peer:get_peer("46.231.204.123", "4001")
          local toJson = json.decode(resp)
          assert.same(toJson["success"], true)
      end)
  end)

  describe('when getting all peers', function()
      it('should return true', function()
          resp = peer:get_peers()
          local toJson = json.decode(resp)
          assert.same(toJson["success"], true)
      end)
  end)

  describe('when getting the peer version', function()
      it('should return true', function()
          resp = peer:get_peer_version()
          local toJson = json.decode(resp)
          assert.same(toJson["success"], true)
      end)
  end)
end)
