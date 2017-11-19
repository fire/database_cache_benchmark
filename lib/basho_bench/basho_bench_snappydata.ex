defmodule BashoBench.SnappyData do
  def new(_state) do
    {:ok, {}}
  end

  def begin() do
    :basho_bench.start()
    :basho_bench.setup_benchmark([])
    :basho_bench.run_benchmark(['./bench/snappydata/snappydata_put.config'])
  end

  def run(:put, key_gen, value_gen, state) do
    id = key_gen.()
    value = value_gen.()
    result =
      case Hello.Repo.get(Hello.World, id) do
        nil  -> %Hello.World{id: id}
        world -> world
      end
      |> Hello.World.changeset(%{random_number: value})
      |> Hello.Repo.insert_or_update
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

  def run(:get, key_gen, _value_gen, state) do
   _ = Hello.CacheableRepo.get(Hello.World, key_gen.())
    {:ok, state}
  end
end