--------------------------------------------
-- Meta Class
--------------------------------------------
local Filter = {
    body_data_filtered = {},
    user_filtered = {},
}

Filter.__index = Filter
--------------------------------------------
-- Constructor
--------------------------------------------
function Filter:new(obj)
    return setmetatable({}, Filter)
end

--------------------------------------------
-- Setters
--------------------------------------------
function Filter:set_body_data_filtered(filtered_data)
    self.body_data_filtered = filtered_data
end

function Filter:set_user_filtered(filtered_data)
    self.user_filtered = filtered_data
end

return Filter