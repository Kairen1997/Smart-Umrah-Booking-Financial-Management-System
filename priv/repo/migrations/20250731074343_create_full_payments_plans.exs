defmodule UmrahBooking.Repo.Migrations.CreateFullPaymentsPlans do
  use Ecto.Migration

  def change do
    create table(:full_payments_plans) do
      add :total_price, :integer
      add :paid_at, :naive_datetime
      add :payment_id, references(:payments, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:full_payments_plans, [:payment_id])
  end
end
