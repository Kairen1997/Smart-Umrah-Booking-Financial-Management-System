defmodule UmrahBooking.Repo.Migrations.CreatePackageDepatureDates do
  use Ecto.Migration

  def change do
    create table(:package_depature_dates) do
      add :depature_date, :date
      add :is_available, :boolean, default: false, null: false
      add :slots_left, :integer
      add :package_id, references(:bookings, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:package_depature_dates, [:package_id])
  end
end
