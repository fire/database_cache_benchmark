defmodule BasicBench do
  use Benchfella

  @id :rand.uniform(10000)
  @random_number :rand.uniform(10000)

  bench "cached select" do
    Hello.CacheableRepo.get!(Hello.World, @id)
  end

  bench "cached update" do
    Hello.CacheableRepo.insert(%Hello.World{id: @id, randomnumber: @random_number})
  end

  bench "select" do
    Hello.Repo.query("select * from world where id = " <> to_string(@id))
  end

  bench "update" do
    Hello.Repo.query("INSERT INTO world (id, randomnumber) VALUES (" <> to_string(@id) <> ", " <> to_string(@random_number) <> ")")
  end
end
