defmodule Hello.Repo.Migrations.AddWorldTable do
  use Ecto.Migration

  def up do
    create table(:world, primary_key: false) do
          add :id, :uuid, primary_key: true
          add :random_number, :integer, [null: false]

          timestamps()
    end
  end

  def down do
    drop table(:world)
  end
end
