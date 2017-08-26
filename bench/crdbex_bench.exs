defmodule BasicBench do
  use Benchfella

  @id to_string(:rand.uniform(10000))
  @random_number to_string(:rand.uniform(10000))

  bench "select" do
    Hello.Repo.query("select * from world where id = " <> @id)
  end

  bench "update" do
    Hello.Repo.query("INSERT INTO world (id, randomnumber) VALUES (" <> @id <> ", " <> @random_number <> ")")
  end
end
