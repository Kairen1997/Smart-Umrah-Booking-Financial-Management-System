defmodule UmrahBooking.Payments.Payment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "payments" do
    field :status, :string
    field :amount, :integer
    field :payment_type, :string
    field :method, :string
    field :payment_date, :date
    field :reference_code, :string
    field :payment_status, :string



    belongs_to :booking, UmrahBooking.Bookings.Booking
    belongs_to :verified_by_admin, UmrahBooking.Accounts.User
    has_one :full_payment_plan, UmrahBooking.Payments.FullPaymentPlan, foreign_key: :payment_id
    has_one :installment_plan, UmrahBooking.Payments.InstallmentPlan, foreign_key: :payment_id
    has_one :receipt, UmrahBooking.Payments.Receipt, foreign_key: :payment_id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(payments, attrs) do
    payments
    |> cast(attrs, [:amount, :payment_type, :method, :status, :payment_date, :reference_code])
    |> validate_required([:amount, :payment_type, :method, :status, :payment_date, :reference_code])
    |> unique_constraint(:reference_code)
  end
end
