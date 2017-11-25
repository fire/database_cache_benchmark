use Mix.Config

config :hello, Hello.Endpoint,
  url: [host: "0.0.0.0"],
  http: [port: 8081, protocol_options: [max_keepalive: 5_000_000]],
  cache_static_lookup: false,
  server: true

config :hello, Hello.LocalCache,
  n_shards: 2,
  gc_interval: 3600

config :hello, Hello.DistCache,
  adapter: Nebulex.Adapters.Dist,
  local: Hello.LocalCache,
  node_picker: Nebulex.Adapters.Dist

config :hello, ecto_repos: [Hello.Repo]

config :hello, Hello.Repo,
  adapter: Ecto.Adapters.SnappyData,
  username: "app",
  password: "",
  hostname: "192.168.0.17",
  pool: DBConnection.Poolboy,
  pool_size: 20,
  schema: "app",
# loggers: [{IO, :inspect, []}],
  port: 1528

config :hello, Hello.CacheableRepo,
  cache: Hello.DistCache,
  repo: Hello.Repo

# ## SSL Support
#
# To get SSL working, you will need to add the `https` key
# to the previous section:
#
#  config:hello, Hello.Endpoint,
#    ...
#    https: [port: 443,
#            keyfile: System.get_env("SOME_APP_SSL_KEY_PATH"),
#            certfile: System.get_env("SOME_APP_SSL_CERT_PATH")]
#
# Where those two env variables point to a file on
# disk for the key and cert.

config :logger, level: :error
