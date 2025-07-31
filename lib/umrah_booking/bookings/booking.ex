defmodule UmrahBooking.Bookings.Booking do
  use Ecto.Schema
  import Ecto.Changeset

  schema "bookings" do
    field :deposit_amount, :integer
    field :preferred_dapature_date, :date
    field :suggested_depature_date, :date
    field :is_affordable, :boolean, default: false
    field :affordability_notes, :string
    field :booking_status, :string
    field :fincal_payment_due_date, :date
    field :approval_notes, :string
    field :payment_completion_status, :string
    field :booking_reference, :string
    field :cancel_reason, :string
    field :reminder_sent, :boolean, default: false
    field :deleted_at, :naive_datetime


    belongs_to :user, UmrahBooking.Accounts.User
    belongs_to :admin, UmrahBooking.Accounts.User, foreign_key: :confirmed_by_admin_id
    has_many :payments, UmrahBooking.Payments.Payments
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(booking, attrs) do
    booking
    |> cast(attrs, [:deposit_amount, :preferred_dapature_date, :suggested_depature_date, :is_affordable, :affordability_notes, :booking_status, :fincal_payment_due_date, :approval_notes, :payment_completion_status, :booking_reference, :cancel_reason, :reminder_sent, :deleted_at])
    |> validate_required([:deposit_amount, :preferred_dapature_date, :suggested_depature_date, :is_affordable, :affordability_notes, :booking_status, :fincal_payment_due_date, :approval_notes, :payment_completion_status, :booking_reference, :cancel_reason, :reminder_sent])
    |> unique_constraint(:booking_reference)
  end
end
