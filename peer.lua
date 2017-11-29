local API = require('api')
local class = require('middleclass')

local api = API()
local Peer = class('Peer')

function Peer:get_peer(ip, port)
  return api:get("api/peers/get", {ip=ip, port=port})
end

function Peer:get_peers()
  return api:get("api/peers")
end

function Peer:get_peer_version()
  return api:get("api/peers/version")
end

return Peer