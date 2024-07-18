#!/bin/ash
# Compile assets
MIX_ENV=prod mix assets.deploy

# Custom tasks (like DB migrations)
MIX_ENV=prod mix ecto.migrate
MIX_ENV=prod mix run /apps/rumbl/priv/repo/seeds.exs
MIX_ENV=prod mix run /apps/rumbl/priv/repo/backend_seeds.exs

# Finally run the server
PORT=4001 MIX_ENV=prod mix phx.server
