local Utils = require('utils')
local EcKey = require('../ec_key')
local basexx = require('basexx')

describe('.decode58Check', function()
	local address = 'AXoXnFi4z1Z6aFvjEYkDVCtBGW2PaRiM25'

	it('should decode correctly', function()
		assert.same(
			basexx.to_hex(Utils:decode58Check(address)):lower(),
			'17afd242cc844425161e373aeaf6a6a09fe5bf54a8'
		)
	end)
end)