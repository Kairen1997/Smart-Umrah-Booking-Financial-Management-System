defmodule UmrahBooking.Repo.Migrations.CreatePayments do
  use Ecto.Migration

  def change do
    create table(:payments) do
      add :amount, :integer
      add :payment_type, :string
      add :method, :string
      add :status, :string
      add :payment_date, :date
      add :reference_code, :string
      add :booking_id, references(:bookings, on_delete: :nothing)
      add :verified_by_admin, references(:users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create unique_index(:payments, [:reference_code])
    create index(:payments, [:booking_id])
    create index(:payments, [:verified_by_admin])
  end
end
