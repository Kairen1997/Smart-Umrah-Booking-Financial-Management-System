defmodule UmrahBooking.Repo.Migrations.CreateAdminLogs do
  use Ecto.Migration

  def change do
    create table(:admin_logs) do
      add :action, :string
      add :target_table, :string
      add :target_id, :integer
      add :notes, :text
      add :logged_at, :naive_datetime
      add :admin_id, references(:users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:admin_logs, [:admin_id])
  end
end
