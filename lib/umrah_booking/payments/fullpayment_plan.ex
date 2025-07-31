defmodule UmrahBooking.Payments.FullPaymentPlan do
  use Ecto.Schema
  import Ecto.Changeset

  schema "full_payments_plans" do
    field :total_price, :integer
    field :paid_at, :naive_datetime
    field :payment_status, :string

    belongs_to :payment, UmrahBooking.Payments.Payment
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(fullpayment_plan, attrs) do
    fullpayment_plan
    |> cast(attrs, [:total_price, :paid_at])
    |> validate_required([:total_price, :paid_at])
  end
end
