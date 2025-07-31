defmodule UmrahBooking.Payments.InstallmentPlan do
  use Ecto.Schema
  import Ecto.Changeset

  schema "installment_plans" do
    field :balance, :integer
    field :total_price, :integer
    field :deposit, :integer
    field :monthly_installment, :integer
    field :months_needed, :integer
    field :start_date, :date
    field :completion_date, :date
    field :paid, :boolean, default: false
    field :next_due_date, :date

    belongs_to :payment, UmrahBooking.Payments.Payment


    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(installment_plan, attrs) do
    installment_plan
    |> cast(attrs, [:total_price, :deposit, :balance, :monthly_installment, :months_needed, :start_date, :completion_date, :paid, :next_due_date])
    |> validate_required([:total_price, :deposit, :balance, :monthly_installment, :months_needed, :start_date, :completion_date, :paid, :next_due_date])
  end
end
