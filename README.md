# Hello

To start your new Phoenix application:

1. Install dependencies with `mix deps.get`
2. Start Phoenix endpoint with `mix phoenix.server`

Now you can visit `localhost:8080` from your browser.

## Benchmarking

mix ecto.create -r Hello.Repo
mix ecto.migrate -r Hello.Repo
MIX_ENV=prod 
mix do app.start, bench -d 10

Note that benchfella is only able to generate load on 1 core.
