local API = require('api')
local class = require('middleclass')

local api = API()
local Loader = class('Loader')


function Loader:get_status()
  -- Get the blockchain status.
  return api:get("api/loader/status")
end


function Loader:get_sync()
  -- Get the synchronisation status of the client.
  return api:get("api/loader/status/sync")
end


function Loader:autoconfigure()
  -- Auto-configure the client Loader.
  return api:get("api/loader/autoconfigure")
end

return Loader