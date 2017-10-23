defmodule BashoBench.Nebulex.Driver do
  def new(_state) do
    {:ok, {}}
  end

  def run(:put, key_gen, value_gen, state) do
    Hello.World.changeset(%Hello.World{}, %{id: Ecto.UUID.generate(), random_number: Ecto.UUID.generate()})
    |>  Hello.Repo.insert
    {:ok, state}
  end

  def run(:get, key_gen, value_gen, state) do
    Hello.CacheableRepo.get(Hello.World, Ecto.UUID.generate())
    {:ok, state}
  end
end