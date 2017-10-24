defmodule BashoBench.Nebulex.Driver do
  def new(_state) do
    {:ok, {}}
  end

  def run(:put_on_conflict, key_gen, value_gen, state) do
    changeset = Hello.World.changeset(%Hello.World{}, %{id: key_gen.(), random_number: value_gen.()})
    case Hello.CacheableRepo.insert(changeset, returning: true, on_conflict: [set: [random_number: value_gen.()]], conflict_target: :id) do
      {:ok, _schema} -> {:ok, state}
      {:error, reason} -> {:error, reason, state}
    end
  end

  def run(:put, key_gen, value_gen, state) do
    result =
      case Hello.CacheableRepo.get(Hello.World, key_gen.()) do
        nil  -> %Hello.World{id: key_gen.(), random_number: value_gen.()}
        world -> world
      end
      |> Hello.World.changeset(%{random_number: value_gen.()})
      |> Hello.CacheableRepo.insert_or_update
    case result do
      {:ok, _schema} -> {:ok, state}
      {:error, reason} -> {:error, reason, state}
    end
  end

  def run(:put_raw, key_gen, value_gen, state) do
    result = Ecto.Adapters.SQL.query(Hello.Repo, "PUT INTO world (id, random_number) VALUES(?, ?)", [key_gen.(), value_gen.()])
    case result do
      {:ok, _schema} -> {:ok, state}
      {:error, reason} -> {:error, reason, state}
    end
  end

  def run(:get, key_gen, value_gen, state) do
   _ = Hello.CacheableRepo.get(Hello.World, key_gen.())
    {:ok, state}
  end
end