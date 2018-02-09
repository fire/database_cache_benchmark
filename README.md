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
Hello.bench
```

```bat
choco install microsoft-r-open
"C:\Program Files\Microsoft\R Open\R-3.4.2\bin\x64\Rscript.exe" G:\Ernest\database_cache_benchmark\deps\basho_bench\priv\summary.r -i G:\Ernest\database_cache_benchmark\tests\20171128_123841\
```