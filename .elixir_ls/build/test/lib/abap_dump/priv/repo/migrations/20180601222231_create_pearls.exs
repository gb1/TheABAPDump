defmodule AbapDump.Repo.Migrations.CreatePearls do
  use Ecto.Migration

  def change do
    create table(:pearls) do
      add :code, :string
      add :author_id, :integer
      add :title, :string
      add :description, :string

      timestamps()
    end

  end
end
