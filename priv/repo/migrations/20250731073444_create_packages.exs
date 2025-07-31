defmodule UmrahBooking.Repo.Migrations.CreatePackages do
  use Ecto.Migration

  def change do
    create table(:packages) do
      add :package_name, :string
      add :package_price, :integer
      add :description, :text
      add :pacakge_id, references(:pacakge_depature_dates, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:packages, [:pacakge_id])
  end
end
