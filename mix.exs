defmodule Hello.Mixfile do
  use Mix.Project

  def project do
   [app: :hello,
    version: "0.1.0",
    elixir: "~> 1.3",
    elixirc_paths: elixirc_paths(Mix.env),
    compilers: [:phoenix] ++ Mix.compilers,
    build_embedded: Mix.env == :prod,
    start_permanent: Mix.env == :prod,
    deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [mod: {Hello, []},
     applications: [:phoenix, :phoenix_ecto, :postgrex, :cowboy, :logger, :phoenix_html]]
  end

  defp elixirc_paths(_), do: ["lib", "web"]

  # Specifies your project dependencies
  #
  # Type `mix help deps` for examples and options
  defp deps do
    [{:phoenix, "~> 1.3"},
     {:phoenix_ecto, "~> 3.0"},
     {:nebulex, "~> 1.0.0-rc.1"},
     {:nebulex_ecto, github: "cabol/nebulex_ecto"},
     {:crdbex, git: "https://github.com/fire/crdbex.git", app: false},
     {:benchfella, "~> 0.3.0"},
#     {:eflame, ~r/.*/, git: "https://github.com/slfritchie/eflame.git", compile: "rebar compile"},
     {:cowboy, "~> 1.0.0"},
     {:phoenix_html, "~> 2.6"},
     {:phoenix_live_reload, "~> 1.0", only: :dev}]
  end
end
