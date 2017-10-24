# Hello

To start your new Phoenix application:

1. Install dependencies with `mix deps.get`
2. Start Phoenix endpoint with `mix phoenix.server`

Now you can visit `localhost:8080` from your browser.

## Benchmarking

```bash
mix ecto.create -r Hello.Repo
mix ecto.migrate -r Hello.Repo
iex -S mix
```

```elixir
:basho_bench.start()
:basho_bench.setup_benchmark([])
:basho_bench.run_benchmark(['./src/basho_bench_nebulex.config'])
```