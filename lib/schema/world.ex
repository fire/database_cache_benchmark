defmodule Hello.World do
  use Ecto.Schema
  import Ecto.Changeset

  schema "world" do
    field :random_number, :integer
    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:id, :random_number])
    |> unique_constraint(:id)
  end
end
