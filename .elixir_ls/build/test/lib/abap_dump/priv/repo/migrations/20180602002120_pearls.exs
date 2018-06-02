defmodule AbapDump.Repo.Migrations.Pearls do
  use Ecto.Migration

  def change do

    alter table(:pearls) do
      modify :code, :text
    end

  end
end
