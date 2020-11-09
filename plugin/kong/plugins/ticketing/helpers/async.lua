--------------------------------------------
-- Meta Class
--------------------------------------------
local Async = {
    ngx = {},
}

Async.__index = Async
--------------------------------------------
-- Constructor
--------------------------------------------
function Async:new(obj, ngx)
    self.ngx = ngx
    return setmetatable({}, Async)
end


function Async:call_async(callback, data, kong)
    local ok, err = self.ngx.timer.at(0, callback, data, kong)
    if not ok then
      kong.log.err("could not create timer: ", err)
    end
end

function Async:save_ticket(ticket, kong)
    local ticket = ticket:getTicket()
    ticket:save(kong)
  end

return Async