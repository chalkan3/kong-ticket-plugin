--------------------------------------------
-- Meta Class
--------------------------------------------
local Debbuger = {
    kong = {},
}

Debbuger.__index = Debbuger
--------------------------------------------
-- Constructor
--------------------------------------------
function Debbuger:new(obj, kong)
    self.kong = kong
    return setmetatable({}, Debbuger)
end

function Debbuger:table(name, table)
    self.kong.log.notice("[ TABLE "..name .." VALUE ]=======>", table)
end


return Debbuger