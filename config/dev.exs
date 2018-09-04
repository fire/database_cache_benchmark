use Mix.Config

config :hello, Hello.Repo,
  adapter: Ecto.Adapters.SnappyData,
  username: "app",
  password: "",
  hostname: "192.168.39.25",
  pool: DBConnection.Poolboy,
  pool_size: 40,
  schema: "app",
  opts: [ssl_opts: [enabled: false, cacertfile: "config/cacerts.pem", certfile: "config/cert.pem", keyfile: "config/key.pem"]],
  # loggers: [{IO, :inspect, []}],
  port: 32239

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"
