package = "ticketing"
version = "0.1-1"


supported_platforms = {"linux", "macosx"}
source = {
  url = "https://github.com/Kong/kong",
  tag = "0.2.0"
}

description = {
  summary = "ticketing is a plugin for save user data between request.",
  homepage = "https://github.com/Kong/kong",
  license = "MIT"
}

dependencies = {
}

local pluginName = "ticketing"
build = {
  type = "builtin",
  modules = {
    ["kong.plugins."..pluginName..".handler"] = "kong/plugins/"..pluginName.."/handler.lua",
    ["kong.plugins."..pluginName..".schema"] = "kong/plugins/"..pluginName.."/schema.lua",
    ["kong.plugins."..pluginName..".daos"] = "kong/plugins/"..pluginName.."/daos.lua",
    ["kong.plugins."..pluginName..".entities.ticket"] = "kong/plugins/"..pluginName.."/entities/ticket.lua",
    ["kong.plugins."..pluginName..".entities.filter"] = "kong/plugins/"..pluginName.."/entities/filter.lua",
    ["kong.plugins."..pluginName..".factory.ticketFactory"] = "kong/plugins/"..pluginName.."/factory/ticketFactory.lua",
    ["kong.plugins."..pluginName..".helpers.async"] = "kong/plugins/"..pluginName.."/helpers/async.lua",
    ["kong.plugins."..pluginName..".migrations"] = "kong/plugins/"..pluginName.."/migrations/init.lua",
    ["kong.plugins."..pluginName..".migrations.000_base_ticketing"] = "kong/plugins/"..pluginName.."/migrations/000_base_ticketing.lua",
  }
}