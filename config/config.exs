# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

config :hello, Hello.LocalCache,
  read_concurrency: false,
  write_concurrency: false,
  gc_interval: 3600

config :hello, Hello.DistCache,
  adapter: Nebulex.Adapters.Dist,
  local: Hello.LocalCache,
  node_picker: Nebulex.Adapters.Dist

config :hello, Hello.CacheableRepo,
  cache: Hello.DistCache,
  repo: Hello.Repo

# Configures the endpoint
config :hello, Hello.Endpoint,
  url: [host: "localhost"],
  http: [port: 8080],
  root: Path.expand(__DIR__),
  debug_errors: false,
  secret_key_base: "Z18ZjzZslFpKd8HB41IljqMavPiOKVF9y1DIQ+S2Ytg7Op0EIauwJgd7mtRStssx",
  pubsub: [name: Hello.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :hello, ecto_repos: [Hello.Repo, Hello.CacheableRepo]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
