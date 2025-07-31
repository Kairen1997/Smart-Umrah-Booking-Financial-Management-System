defmodule UmrahBooking.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :role, :string
    field :email, :string
    field :password_hash, :string

    has_one :profile, UmrahBooking.Accounts.UserProfile
    has_many :bookings, UmrahBooking.Bookings.Booking
    has_many :confirmed_bookings, UmrahBooking.Bookings.Booking, foreign_key: :confirmed_by_admin_id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :password_hash, :role])
    |> validate_required([:name, :email, :password_hash, :role])
    |> unique_constraint(:email)
  end
end
