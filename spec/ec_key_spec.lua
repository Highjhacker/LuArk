local Utils = require('utils')
local EcKey = require('../ec_key')

local secret = 'this is a top secret passphrase'

describe('.secret_to_public_key', function()
	it('should give back the correct public key', function()
		assert.same(
			Utils:decodeBase16(EcKey:secret_to_public_key(secret)),
			"034151a3ec46b5670a682b0a63394f863587d1bc97483b1b6c70eb58e7f0aed192"
		)
	end)
end)

describe('.public_key_to_address', function()
	it('should give back the correct address', function()
		assert.same(
			EcKey:public_key_to_address(
				EcKey:secret_to_public_key(secret)
			),
			"AGeYmgbg2LgGxRW2vNNJvQ88PknEJsYizC"
		)
	end)

	describe('when given a network address', function()
		it('should give back the correct address', function()
			assert.same(
				EcKey:public_key_to_address(
					EcKey:secret_to_public_key(secret),
					0x1e
				),
				"D61mfSggzbvQgTUe6JhYKH2doHaqJ3Dyib"
			)
		end)
	end)
end)