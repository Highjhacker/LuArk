local API = require('api')
local class = require('middleclass')

local api = API()
local signature = require('signature')

local json = require('json')

describe('signature()', function()

  describe('when getting the fee for a signature', function()
      it('should return true', function()
          resp = signature:get_signature_fee()
          local toJson = json.decode(resp)
          assert.same(toJson["success"], true)
      end)
  end)

  describe('when getting the fee for a signature on a specified address', function()
      it('should return true', function()
          resp = signature:get_address_signature_fee("Aasu14aTs9ipZdy1FMv7ay1Vqn3jPskA8t")
          local toJson = json.decode(resp)
          assert.same(toJson["success"], true)
      end)
  end)
end)
