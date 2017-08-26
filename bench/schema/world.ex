defmodule Hello.World do
  use Ecto.Schema

  @primary_key(:id)
  schema "world" do
    field :id, :integer
    field :randomnumber, :integer
  end
end
