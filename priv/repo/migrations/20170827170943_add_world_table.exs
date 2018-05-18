defmodule Hello.Repo.Migrations.AddWorldTable do
  use Ecto.Migration

  def up do
    create table(:world, options: "USING ROW OPTIONS (PARTITION_BY 'PRIMARY KEY', PERSISTENCE 'ASYNC')") do
          add :random_number, :integer, [null: false]

          timestamps()
    end
  end

  def down do
    drop table(:world)
  end
end
