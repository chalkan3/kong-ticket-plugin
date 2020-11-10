local typedefs = require "kong.db.schema.typedefs"

return {
    ticketing = {
      name               = "ticketing", -- the actual table in the database
      primary_key        = { "id" },
      generate_admin_api = true,
      fields = {
        {
          id = typedefs.uuid,
        },
        {
          -- also interted by the DAO itself
          created_at = typedefs.auto_timestamp_s,
        },
        {
            status_code = {
                type      = "integer",
                required  = true,
                unique    = false,
                auto      = false,
              },
          
        },
        {
            execution_time = {
                type      = "string",
                required  = false,
                unique    = false,
                auto      = false,
              },
          
        },
        {
          credentials_id = {
              type      = "string",
              required  = false,
              unique    = false,
              auto      = false,
            },
        
      },
      {
        consumer_id = {
            type      = "string",
            required  = false,
            unique    = false,
            auto      = false,
          },
      
    },
        {
            request_start_time = {
                type      = "string",
                required  = false,
                unique    = false,
                auto      = false,
              },
          
        },

      },
    },
  }