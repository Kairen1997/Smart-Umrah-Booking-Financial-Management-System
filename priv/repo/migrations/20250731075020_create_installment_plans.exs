defmodule UmrahBooking.Repo.Migrations.CreateInstallmentPlans do
  use Ecto.Migration

  def change do
    create table(:installment_plans) do
      add :total_price, :integer
      add :deposit, :integer
      add :balance, :integer
      add :monthly_installment, :integer
      add :months_needed, :integer
      add :start_date, :date
      add :completion_date, :date
      add :paid, :boolean, default: false, null: false
      add :next_due_date, :date
      add :payment_id, references(:payments, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:installment_plans, [:payment_id])
  end
end
