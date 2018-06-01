defmodule AbapDump.TAD.Pearl do
  use Ecto.Schema
  import Ecto.Changeset


  schema "pearls" do
    field :author_id, :integer
    field :code, :string
    field :description, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(pearl, attrs) do
    pearl
    |> cast(attrs, [:code, :author_id, :title, :description])
    |> validate_required([:code, :author_id, :title, :description])
  end
end
