defmodule BashoBench.Nebulex.Driver do
  def new(_state) do
    {:ok, {}}
  end

  def run(:put, key_gen, value_gen, state) do
    {ok, _schema} = Hello.World.changeset(%Hello.World{}, %{id: key_gen.(), random_number: value_gen.()})
    |>  Hello.Repo.insert
    {ok, state}
  end

  def run(:get, key_gen, value_gen, state) do
    {ok, _schema} = Hello.CacheableRepo.get(Hello.World, key_gen.())
    {ok, state}
  end
end