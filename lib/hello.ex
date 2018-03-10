defmodule Hello do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      # Start the endpoint when the application starts
      # Here you could define other workers and supervisors as children
      # Start the Ecto repository,
      worker(Hello.Repo, []),
      supervisor(Hello.LocalCache, []),
      supervisor(Hello.DistCache, [])
      # worker(Hello.Worker, [arg1, arg2, arg3]),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Hello.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def bench(type \\ :read_write) do
    :basho_bench.start()
    :basho_bench.setup_benchmark([])

    case type do
      :read -> :basho_bench.run_benchmark(['./config/bench/snappydata_read.config'])
      :read_cache -> :basho_bench.run_benchmark(['./config/bench/snappydata_read_cache.config'])
      :read_write -> :basho_bench.run_benchmark(['./config/bench/snappydata.config'])
      :read_write_cache -> :basho_bench.run_benchmark(['./config/bench/snappydata_cache.config'])
    end
  end

end
