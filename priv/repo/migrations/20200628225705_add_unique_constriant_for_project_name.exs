defmodule Pm.Repo.Migrations.AddUniqueConstriantForProjectName do
  use Ecto.Migration

  def change do
    create unique_index(:projects, [:name])
  end
end
