return {
    postgres = {
        up = [[
          CREATE TABLE IF NOT EXISTS "ticketing" (
            "id"           UUID  PRIMARY KEY,
            "created_at"   TIMESTAMP WITHOUT TIME ZONE,
            "execution_time"         VARCHAR (30),
            "request_start_time" VARCHAR (30),
            "consumer_id"         VARCHAR (60),
            "credentials_id" VARCHAR (60),
            "status_code" integer
          );
        ]],
      },
      cassandra = {
        up = [[]]
      }
}