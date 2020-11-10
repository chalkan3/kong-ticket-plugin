
local typedefs = require "kong.db.schema.typedefs"

return {
  name = "filter",
  fields = {
    { config = {
        type = "record",
        fields = {
          { remove = {
            type = "array",
            default = {},
            elements = { type = "string" },
          } }
        },
      },
    },
  },
}