defmodule Hello.Mixfile do
  use Mix.Project

  def project do
    [
      app: :hello,
      version: "0.1.0",
      elixir: "~> 1.3",
      elixirc_paths: elixirc_paths(Mix.env()),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [
      mod: {Hello, []},
      applications: [:snappyex, :snappydata_ecto, :cowboy, :logger, :basho_bench]
    ]
  end

  defp elixirc_paths(_), do: ["lib", "web"]

  # Specifies your project dependencies
  #
  # Type `mix help deps` for examples and options
  defp deps do
    [
      {:nebulex, "~> 1.0.0-rc.1"},
      {:nebulex_ecto, github: "cabol/nebulex_ecto"},
      {:basho_bench, github: "mrallen1/basho_bench", ref: "mra-rebar3"},
      {:snappydata_ecto, github: "fire/snappydata_ecto"},
      {:thrift, github: "pinterest/elixir-thrift", override: true},
      {:cowboy, "~> 1.0.0"}
    ]
  end
end
