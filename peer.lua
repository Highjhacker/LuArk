local API = require('api')
local class = require('middleclass')

local api = API()
local Peer = class('Peer')

function Peer:get_peer(ip, port)
  -- Get a single peer.
  -- :param ip: Valid IP of the peer.
  -- :param port: Valid port of the peer.
  return api:get("api/peers/get", {ip=ip, port=port})
end

function Peer:get_peers()
  -- Get all peers.
  return api:get("api/peers")
end

function Peer:get_peer_version()
  -- Get the peer version.
  return api:get("api/peers/version")
end

return Peer