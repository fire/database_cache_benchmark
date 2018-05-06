use Mix.Config

config :hello, Hello.Repo,
  adapter: Ecto.Adapters.SnappyData,
  username: "app",
  password: "",
  hostname: "192.168.0.10",
  pool: DBConnection.Poolboy,
  pool_size: 20,
  schema: "app",
  opts: [ssl_opts: [enabled: true, cacertfile: "config/cacerts.pem", certfile: "config/cert.pem", keyfile: "config/key.pem"]],
  # loggers: [{IO, :inspect, []}],
  port: 30067

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
