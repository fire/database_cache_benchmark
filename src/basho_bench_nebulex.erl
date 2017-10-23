-module(basho_bench_nebulex).

-export([
  new/1,
  run/4
]).

-define(nbx_cache, 'Elixir.NbxCache').

new(_State) ->
  {ok, #{}}.

run(get, KeyGen, _ValueGen, State) ->
  Key = KeyGen(),
  _ = ?nbx_cache:get(Key),
  {ok, State};

run(put, KeyGen, ValueGen, State) ->
  ?nbx_cache:set(KeyGen(), ValueGen()),
  {ok, State}.