# Hello

To start your new Phoenix application:

1. Install dependencies with `mix deps.get`
2. Start Phoenix endpoint with `mix phoenix.server`

Now you can visit `localhost:8080` from your browser.

## Benchmarking

```bash
export MIX_ENV=prod
mix ecto.create -r Hello.Repo
mix ecto.migrate -r Hello.Repo
iex -S mix
```

```elixir
:basho_bench.start()
:basho_bench.setup_benchmark([])
:basho_bench.run_benchmark(['./bench/basho_bench_nebulex.config'])
```

```bat
"C:\Program Files\Microsoft\R Open\R-3.4.1\bin\x64\Rscript.exe" D:\projects\database_cache_benchmark\deps\basho_bench\priv\summary.r -i D:\projects\database_cache_benchmark\tests\
```