local API = require('api')
local class = require('middleclass')

local api = API()
local multisignature = require('multisignature')

local json = require('json')

describe('multisignature()', function()

  describe('when getting the pending multisig transactions', function()
      it('should return true', function()
          resp = multisignature:get_pending("02c7455bebeadde04728441e0f57f82f972155c088252bf7c1365eb0dc84fbf5de")
          local toJson = json.decode(resp)
          assert.same(toJson["success"], true)
      end)
  end)

  --[[ Doesn't works even in the swagger app.
    describe('when getting the multisigs accounts', function()
      it('should return true', function()
          resp = multisignature:get_accounts("02ff171adaef486b7db9fc160b28433d20cf43163d56fd28fee72145f0d5219a4b ")
          local toJson = json.decode(resp)
          assert.same(toJson["success"], true)
      end)
  end)
  --]]
end)
