local basexx = require('basexx')
local base58 = require("base58")
local trezor_crypto = require('trezor_crypto')

local class = require('middleclass')
local Utils = class('Utils')


function Utils:tableMerge(t1, t2)
    for k,v in pairs(t2) do
        if type(v) == "table" then
            if type(t1[k] or false) == "table" then
                tableMerge(t1[k] or {}, t2[k] or {})
            else
                t1[k] = v
            end
        else
            t1[k] = v
        end
    end
    return t1
end

function Utils:decodeBase16(str)
    return string.lower(basexx.to_hex(str))
end

function Utils:decode58Check(str)
    local data = base58.decode_base58(str)
    local payload_size = #data - 4
    local payload = string.sub(data, 1, payload_size)
    local checksum = string.sub(data, payload_size + 1)

    local payload_checksum = trezor_crypto.sha256(
        basexx.to_hex(trezor_crypto.sha256(basexx.to_hex(payload)))
    ):sub(1, 4)
    assert(
        checksum == payload_checksum,
        "Invalid Base58Check string: checksum invalid in " .. str
    )

    return payload
end

function Utils:encode58Check(str)
    local checksum = trezor_crypto.sha256(
        basexx.to_hex(trezor_crypto.sha256(basexx.to_hex(str)))
    ):sub(1, 4)
    return base58.encode_base58(str .. checksum)
end

return Utils