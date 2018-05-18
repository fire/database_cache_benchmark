defmodule Hello.BashoBench.SnappyData do
  def new(_state) do
    {:ok, {}}
  end

  def run(:put_cache, key_gen, value_gen, state) do
    id = key_gen.()
    value = value_gen.()

    result =
      case Hello.CacheableRepo.get(Hello.World, id) do
        nil -> %Hello.World{id: id}
        world -> world
      end
      |> Hello.World.changeset(%{random_number: value})
      |> Hello.CacheableRepo.insert_or_update()

    case result do
      {:ok, _schema} -> {:ok, state}
      {:error, reason} -> {:error, reason, state}
    end
  end

  def run(:put, key_gen, value_gen, state) do
    id = key_gen.()
    value = value_gen.()

    result =
      case Hello.Repo.get(Hello.World, id) do
        nil -> %Hello.World{id: id}
        world -> world
      end
      |> Hello.World.changeset(%{random_number: value})
      |> Hello.Repo.insert_or_update()

    case result do
      {:ok, _schema} -> {:ok, state}
      {:error, reason} -> {:error, reason, state}
    end
  end

  # def run(:put_raw, key_gen, value_gen, state) do
  #   result = Ecto.Adapters.SQL.query(Hello.Repo, ~s(PUT INTO bench.world \("id", "random_number", "inserted_at", "updated_at"\) VALUES\(?, ?, ?, ?\)), [key_gen.(), value_gen.(), DateTime.utc_now(), DateTime.utc_now()])
  #   case result do
  #     {:ok, _schema} -> {:ok, state}
  #     {:error, reason} -> {:error, reason, state}
  #   end
  # end

  def run(:get_cache, key_gen, _value_gen, state) do
    case Hello.CacheableRepo.get(Hello.World, key_gen.()) do
      %Hello.World{} -> {:ok, state}
      nil -> {:ok, state}
    end
  end
  
  def run(:get, key_gen, _value_gen, state) do
    case Hello.Repo.get(Hello.World, key_gen.()) do
      %Hello.World{} -> {:ok, state}
      nil -> {:ok, state}
    end
  end
end
