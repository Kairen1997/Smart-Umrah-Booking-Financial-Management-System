defmodule UmrahBooking.Admin.Setting do
  use Ecto.Schema
  import Ecto.Changeset

  schema "admin_settings" do
    field :value, :string
    field :key, :string
    field :updated_by, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(setting, attrs) do
    setting
    |> cast(attrs, [:key, :value])
    |> validate_required([:key, :value])
    |> unique_constraint(:key)
  end
end
