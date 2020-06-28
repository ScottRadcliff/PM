defmodule Pm.Repo.Migrations.UpdateProjectNameToCitext do
  use Ecto.Migration

  def up do
    execute "CREATE EXTENSION citext"
    alter table(:projects) do
      modify(:name, :citext, null: false)
    end
  end

  def down do
    alter table(:projects) do
      remove(:name)
    end
    execute "DROP EXTENSION citext"
  end
end
