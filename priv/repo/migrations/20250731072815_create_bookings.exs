defmodule UmrahBooking.Repo.Migrations.CreateBookings do
  use Ecto.Migration

  def change do
    create table(:bookings) do
      add :deposit_amount, :integer
      add :preferred_dapature_date, :date
      add :suggested_depature_date, :date
      add :is_affordable, :boolean, default: false, null: false
      add :affordability_notes, :text
      add :booking_status, :string
      add :fincal_payment_due_date, :date
      add :approval_notes, :text
      add :payment_completion_status, :string
      add :booking_reference, :string
      add :cancel_reason, :text
      add :reminder_sent, :boolean, default: false, null: false
      add :deleted_at, :naive_datetime
      add :user_id, references(:users, on_delete: :nothing)
      add :confirmed_by_admin_id, references(:users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create unique_index(:bookings, [:booking_reference])
    create index(:bookings, [:user_id])
    create index(:bookings, [:confirmed_by_admin_id])
  end
end
