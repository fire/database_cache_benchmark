defmodule BashoBench.Nebulex.Driver do
  def new(_state) do
    {:ok, {}}
  end

  def run(:put, key_gen, value_gen, state) do
    changeset = Hello.World.changeset(%Hello.World{}, %{id: key_gen.(), random_number: value_gen.()})
    case Hello.CacheableRepo.insert(changeset, returning: true, on_conflict: :replace_all, conflict_target: :id) do
      {:ok, _schema} -> {:ok, state}
      {:error, reason} -> {:error, reason, state}
    end
  end

  def run(:get, key_gen, value_gen, state) do
   _ = Hello.CacheableRepo.get(Hello.World, key_gen.())
    {:ok, state}
  end
end