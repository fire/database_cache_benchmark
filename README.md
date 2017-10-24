# Hello

To start your new Phoenix application:

1. Install dependencies with `mix deps.get`
2. Start Phoenix endpoint with `mix phoenix.server`

Now you can visit `localhost:8080` from your browser.

## Benchmarking

```bash
mix ecto.create -r Hello.Repo
mix ecto.migrate -r Hello.Repo
MIX_ENV=prod iex -S mix
```

```elixir
:basho_bench.start()
:basho_bench.setup_benchmark([])
:basho_bench.run_benchmark(['./src/basho_bench_nebulex.config'])
```

```bat
"C:\Program Files\Microsoft\R Open\R-3.4.1\bin\x64\Rscript.exe" G:\database_cache_benchmark\deps\basho_bench\priv\summary.r -i G:\database_cache_benchmark\tests\20171024_075858
```