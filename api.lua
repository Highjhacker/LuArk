local class = require('middleclass')
local requests = require('requests')

local API = class('API')

local ARK_MAINNET_URL = 'https://api.arknode.net/'
local ARK_MAINNET_NETHASH = '6e84d08bd299ed97c212c886c98a57e36545c8f5d645ca7eeae63a8bd62d8988'
local ARK_MAINNET_VERSION = '1.0.1'
local ARK_MAINNET_PORT = 4001

function API:initialize(base_url, nethash, version, port)
  self.base_url = base_url or ARK_MAINNET_URL
  self.headers = {
    nethash=nethash or ARK_MAINNET_NETHASH,
    version=version or ARK_MAINNET_VERSION,
    port=port or ARK_MAINNET_PORT
  }
end

function API:get(endpoint, ...)
  local response = requests.get{
    url=self.base_url..endpoint,
    headers=self.headers,
    params=...
  }

  if response.status_code == 200 then
    return response.text
  else
    print("Error while fetching the URL.")
  end
end

function API:post(endpoint, ...)
  local headers = {['Content-Type']='application/json' }
  for k,v in pairs(self.headers) do headers[k] = v end

  local response = requests.post{
    url=self.base_url..endpoint,
    headers=headers,
    data=...,
  }

  if response.status_code == 200 then
    return response.json()
  else
    print("Error while fetching the URL.")
  end
end

return API
