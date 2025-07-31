defmodule UmrahBooking.Repo.Migrations.CreateAdminSettings do
  use Ecto.Migration

  def change do
    create table(:admin_settings) do
      add :key, :string
      add :value, :string
      add :updated_by, references(:users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create unique_index(:admin_settings, [:key])
    create index(:admin_settings, [:updated_by])
  end
end
