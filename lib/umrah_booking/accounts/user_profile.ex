defmodule UmrahBooking.Accounts.UserProfile do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users_profile" do
    field :address, :string
    field :monthly_income, :integer
    field :IC_number, :string
    field :phone_number, :string
    field :gender, :string
    field :birthdate, :date

    belongs_to :user, UmrahBooking.Accounts.User
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user_profile, attrs) do
    user_profile
    |> cast(attrs, [:monthly_income, :IC_number, :phone_number, :gender, :birthdate, :address])
    |> validate_required([:monthly_income, :IC_number, :phone_number, :gender, :birthdate, :address])
    |> unique_constraint(:phone_number)
    |> unique_constraint(:IC_number)
  end
end
