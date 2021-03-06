local API = require('api')
local class = require('middleclass')

local api = API()
local delegate = require('delegate')

local json = require('json')

describe('delegate()', function()

  describe('when getting the count of delegates', function()
      it('should return true', function()
          resp = delegate:get_delegates_count("ANwjGUcVbLXpqbBUWbjUBQWkr4MWVDuJu9")
          local toJson = json.decode(resp)
          assert.same(toJson["success"], true)
      end)
  end)

  describe('when searching for a delegate', function()
      it('should return true and limit the results to 5', function()
          resp = delegate:search_delegates({q="dr"}, {limit=5})
          local toJson = json.decode(resp)
          assert.same(toJson["success"], true)
      end)
  end)

  describe('when getting a list of voters for a delegate', function()
      it('should return true', function()
          resp = delegate:get_voters("031641ff081b93279b669f7771b3fbe48ade13eadb6d5fd85bdd025655e349f008")
          local toJson = json.decode(resp)
          assert.same(toJson["success"], true)
      end)
  end)

  describe('when getting a single delegate by his username', function()
      it('should return true', function()
          resp = delegate:get_delegate("jarunik")
          local toJson = json.decode(resp)
          assert.same(toJson["success"], true)
      end)
  end)

  describe('when getting a single delegate his publicKey', function()
      it('should return true', function()
          resp = delegate:get_delegate_publickey("02c7455bebeadde04728441e0f57f82f972155c088252bf7c1365eb0dc84fbf5de")
          local toJson = json.decode(resp)
          assert.same(toJson["success"], true)
      end)
  end)

  describe('when getting all of the delegates', function()
      it('should return true and limit the results to 5 and order them by username', function()
          resp = delegate:get_delegates({limit=5, orderBy="username"})
          local toJson = json.decode(resp)
          assert.same(toJson["success"], true)
      end)
  end)

  describe('when getting the delegate fee', function()
      it('should return true', function()
          resp = delegate:get_delegate_fee("Aasu14aTs9ipZdy1FMv7ay1Vqn3jPskA8t")
          local toJson = json.decode(resp)
          assert.same(toJson["success"], true)
      end)
  end)

  describe('when getting the amount of ark forged by an account', function()
      it('should return true', function()
          resp = delegate:get_forged_by_account("02c7455bebeadde04728441e0f57f82f972155c088252bf7c1365eb0dc84fbf5de")
          local toJson = json.decode(resp)
          assert.same(toJson["success"], true)
      end)
  end)

  describe('when getting next forgers', function()
      it('should return true', function()
          resp = delegate:get_next_forgers("ANwjGUcVbLXpqbBUWbjUBQWkr4MWVDuJu9")
          local toJson = json.decode(resp)
          assert.same(toJson["success"], true)
      end)
  end)
end)
