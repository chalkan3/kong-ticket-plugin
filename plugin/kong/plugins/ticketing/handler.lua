--------------------#O2B - Plugin ticketing ------------------
------------------------------------------------------------------
-- Imports
------------------------------------------------------------------
local BasePlugin = require "kong.plugins.base_plugin"
local Filter = require "kong.plugins.ticketing.entities.filter"
local TicketFactory = require "kong.plugins.ticketing.factory.ticketFactory"
local Async = require "kong.plugins.ticketing.helpers.async"

------------------------------------------------------------------
-- Global Instances
------------------------------------------------------------------
local kong = kong
local ticket_factory = TicketFactory:new(nil)
local async = Async:new(nil, ngx)
------------------------------------------------------------------
-- Main class Ticketing - Priority 800 [after oauth plugin ]
------------------------------------------------------------------
local Ticketing = BasePlugin:extend()
Ticketing.PRIORITY = 14

------------------------------------------------------------------
-- Async functions
------------------------------------------------------------------
function Dump(o)
  if type(o) == 'table' then
     local s = '{ '
     for k,v in pairs(o) do
        if type(k) ~= 'number' then k = '"'..k..'"' end
        s = s .. '['..k..'] = ' .. Dump(v) .. ','
     end
     return s .. '} '
  else
     return tostring(o)
  end
end

function Save(premature, payload)
  if premature then
    return
  end

  local ticket = payload:getTicket()
  ticket:save(kong)
end
------------------------------------------------------------------
-- Constructor  -> create ticketing
------------------------------------------------------------------
function Ticketing:new()
  Ticketing.super.new(self, "Ticketing")
end
------------------------------------------------------------------
-- Access phase ->  get my credentials of OAuth plugin
------------------------------------------------------------------
function Ticketing:access(conf)
  local filter = Filter:new(nil)
  local credential = kong.client.get_credential()
  local consumer = kong.client.get_consumer()
  
  filter:set_user_filtered({
    credential_id = credential.id,
    consumer_id = consumer.id,
  })

  kong.ctx.plugin.filter = filter

end

------------------------------------------------------------------
-- Body filter phase -> get custom header to filter data to save
------------------------------------------------------------------
function Ticketing:body_filter(conf)
       local filter = kong.ctx.plugin.filter

       filter:set_body_data_filtered({
          execution_time = "0.5",
          request_start_time = "now",
          status = kong.response.get_status(),
        })

        kong.ctx.plugin.filter = filter
end

------------------------------------------------------------------
-- Log phase -> save all filtered data
------------------------------------------------------------------
function Ticketing:log(conf)
  async:call_async(
    async.save_ticket,
    ticket_factory:create_ticket(kong.ctx.plugin.filter),
    kong
  )
end

-- return the plugin class
return Ticketing