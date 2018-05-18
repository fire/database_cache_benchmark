
```elixir
Hello.World.changeset(%Hello.World{}, %{id: 100014, random_number: 1, inserted_at: DateTime.utc_now, updated_at: DateTime.utc_now}) |> Hello.Repo.insert!
Hello.Repo.get(Hello.World, 1)
Hello.Repo.query(~s(SELECT w0."id", w0."random_number", w0."inserted_at", w0."updated_at" FROM BENCH.WORLD AS w0 WHERE \(w0."id" = \(?\)\)), [1])
Hello.Repo.query(~s(INSERT INTO BENCH.WORLD\("id", "random_number", "inserted_at", "updated_at"\) VALUES\(?,?,?,?\)), [100018, 1, DateTime.utc_now, DateTime.utc_now])
Hello.Repo.one(Hello.World)
Hello.Repo.load(%{id: :integer, random_number: :integer, inserted_at: :naive_datetime, updated_at: :naive_datetime}, %{id: 100015, random_number: 1, inserted_at: NaiveDateTime.utc_now, updated_at: NaiveDateTime.utc_now})
```

```elixir
# Postgrex
iex(5)> Hello.Repo.get(Hello.World, 1)
[debug] QUERY OK source="world" db=1.5ms decode=2.5ms
SELECT w0."id", w0."random_number", w0."inserted_at", w0."updated_at" FROM "bench"."world" AS w0 WHERE (w0."id" = $1) [1]
%Hello.World{__meta__: #Ecto.Schema.Metadata<:loaded, "bench", "world">, id: 1,
 inserted_at: ~N[2017-11-03 07:50:44.842958], random_number: 5840,
 updated_at: ~N[2017-11-03 07:50:44.842965]}

iex(5)> Hello.Repo.query("SELECT w0.id, w0.random_number, w0.inserted_at, w0.updated_at FROM BENCH.WORLD AS w0 WHERE (w0
.id = ($1))", [1])
[debug] QUERY OK db=1.5ms
SELECT w0.id, w0.random_number, w0.inserted_at, w0.updated_at FROM BENCH.WORLD AS w0 WHERE (w0.id = ($1)) [1]
{:ok,
 %Postgrex.Result{columns: ["id", "random_number", "inserted_at", "updated_at"],
  command: :select, connection_id: nil, num_rows: 1,
  rows: [[1, 5840, {{2017, 11, 3}, {7, 50, 44, 842958}},
    {{2017, 11, 3}, {7, 50, 44, 842965}}]]}}
iex(6)>

Ecto.Adapters.SQL.query(Hello.Repo, "SELECT w0.id, w0.random_number, w0.inserted_at, w0.updated_at FROM BENCH.WORLD AS w0 WHERE (w0.id = (?))", [1])
{:ok, q} = Ecto.Adapters.SQL.query(Hello.Repo, "SELECT w0.id, w0.random_number, w0.inserted_at, w0.updated_at FROM BENCH.WORLD AS w0 WHERE (w0.id = (?))", [1])
Hello.World.__schema__(:load,q.rows |> List.first)

{:ok, result} = Ecto.Adapters.SQL.query(Hello.Repo, "SELECT w0.id, w0.random_number, w0.inserted_at, w0.updated_at FROM BENCH.WORLD AS w0 WHERE (w0.id = (?))", [1])
Enum.map(result.rows, &Hello.Repo.load(Hello.Repo, {result.columns, &1}))

Hello.Repo.load(Hello.World, {[:id, :random_number], [1, 3083, ~N[2017-11-19 06:04:02.473399],
    ~N[2017-11-19 06:04:02.473406]]})

Ecto.Repo.Queryable.get(Hello.Repo, Ecto.Adapters.SnappyData, Hello.World, 1, [])

:dbg.tracer()
:dbg.p(:all,:c)
:dbg.tpl(Ecto.Repo.Queryable,:get,:x)

import Ecto.Query, only: [from: 2]
query = from p in Hello.World,
         select: [p.id, p.random_number, p.inserted_at, p.updated_at],
          where: p.id == 1
Hello.Repo.all(query)
query = from p in Hello.World,
          where: p.id == 1
Hello.Repo.all(query)
Hello.Repo.query(~s(SELECT w0."id", w0."random_number", w0."inserted_at", w0."updated_at" FROM BENCH.WORLD AS w0 WHERE \(w0."id" = 1\)), [])

world = Hello.CacheableRepo.get(Hello.World, 1)
set =  Hello.World.changeset(world, %{random_number: 6})
Hello.CacheableRepo.insert_or_update(set)

Hello.Repo.query(~s(UPDATE BENCH.WORLD SET \"random_number\"=?, \"updated_at\"=? WHERE \"id\"=?"), [9425, {{2017, 11, 19}, {19, 48, 11, 490219}}, 19])

Hello.Repo.query(~s(UPDATE BENCH.WORLD SET \"random_number\" = ?, \"updated_at\" = ? WHERE \"id\" = ?), [9425, {{2017, 11, 19}, {19, 48, 11, 490219}}, 10])

world = Hello.Repo.get(Hello.World, 1)
set =  Hello.World.changeset(world, %{random_number: 4})
Hello.Repo.insert_or_update(set)

Hello.Repo.query("CREATE TABLE SNAPPYEX_TEST.TEST_ENCODE (id int primary key, title varchar(20), body string, f float, d double, b bigint, curr timestamp)", [])
{:ok, result} = Hello.Repo.query("DROP TABLE IF EXISTS SNAPPYEX_TEST.TEST_ENCODE", [])
rows = result.rows

BashoBench.SnappyData.begin
```