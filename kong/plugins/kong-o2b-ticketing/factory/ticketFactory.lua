local Ticket = require "kong.plugins.ticketing.entities.ticket"

--------------------------------------------
-- Meta Class
--------------------------------------------
local TicketFactory = { }

TicketFactory.__index = TicketFactory
--------------------------------------------
-- Constructor
--------------------------------------------
function TicketFactory:new(obj)
    return setmetatable({}, TicketFactory)
end

--------------------------------------------
-- Create :)
--------------------------------------------
function TicketFactory:create_ticket(filter)
    return Ticket:new(
        nil,
        filter.body_data_filtered.status,
        filter.body_data_filtered.execution_time,
        filter.body_data_filtered.request_start_time,
        filter.user_filtered.consumer_id,
        filter.user_filtered.credential_id
    )
end



return TicketFactory