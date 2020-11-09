--------------------------------------------
-- Meta Class
--------------------------------------------
local Ticket = {
    status_code = 0,
    execution_time = "",
    request_start_time = "",
    credential_id = "",
    consumer_id = "",
}

Ticket.__index = Ticket
--------------------------------------------
-- Constructor
--------------------------------------------
function Ticket:new(obj, status_code, execution_time, request_start_time, consumer_id, credential_id)
    self.status_code = status_code
    self.execution_time = execution_time
    self.request_start_time = request_start_time
    self.consumer_id = consumer_id
    self.credential_id = credential_id
    return setmetatable({}, Ticket)
end

--------------------------------------------
-- Setters
--------------------------------------------
function Ticket:set_status_code(status_code)
    self.status_code = status_code
end

function Ticket:set_execution_time(execution_time)
    self.execution_time = execution_time
end

function Ticket:set_request_stat_time(request_stat_time)
    self.request_stat_time = request_stat_time
end

function Ticket:set_credential_id(credential_id)
    self.credential_id = credential_id
end

function Ticket:set_consumer_id(consumer_id)
    self.consumer_id = consumer_id
end


--------------------------------------------
-- Get instance
--------------------------------------------
function Ticket:getTicket()
    return self
end


--------------------------------------------
-- Save data on postgres database
--------------------------------------------
function Ticket:save(kong)
    local ticketing, err = kong.db.ticketing:insert({
      status_code = self.status_code,
      execution_time = self.execution_time,
      request_start_time = self.request_start_time,
      consumer_id = self.consumer_id,
      credentials_id = self.credential_id,
    })
    if err then
        kong.log.err(err)
    end 
  end

return Ticket