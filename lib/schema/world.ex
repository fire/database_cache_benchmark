defmodule Hello.World do
  use Ecto.Schema

  @primary_key {:id, :binary_id, autogenerate: true}
  @derive {Phoenix.Param, key: :id}
  schema "world" do
    field :randomnumber, :integer
    timestamps()
  end
end
