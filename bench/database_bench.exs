defmodule BasicBench do
  use Benchfella

  @id Ecto.UUID.generate()

   setup_all do
    Hello.World.changeset(%Hello.World{}, %{id: @id, random_number: :rand.uniform(10000)})
    |> Hello.CacheableRepo.insert_or_update
    {:ok, nil}
  end

  bench "cached select" do
    Hello.CacheableRepo.get(Hello.World, @id)
    :ok
  end

  bench "select all" do
    Hello.Repo.all(Hello.World)
    :ok
  end

  bench "insert" do
     Hello.World.changeset(%Hello.World{}, %{id: Ecto.UUID.generate(), random_number: :rand.uniform(10000)})
     |>  Hello.CacheableRepo.insert
     :ok
  end
end
