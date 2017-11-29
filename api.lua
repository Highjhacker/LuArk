local class = require('middleclass')
local requests = require('requests')

local API = class('API')

function API:initialize()
  self.base_url = "https://api.arknode.net/"
end

function API:get(endpoint, ...)

  headers = {
      ["nethash"] = '6e84d08bd299ed97c212c886c98a57e36545c8f5d645ca7eeae63a8bd62d8988',
      ["version"] = '1.0.1',
      ["port"] = '4001'
  }

  local query_parameters = ...

  response = requests.get{url=self.base_url..endpoint, headers=headers, params=query_parameters}

  if response.status_code == 200 then
    return response.text
  else
    print("Error while fetching the URL.")
  end
end

return API
