defmodule UmrahBooking.Packages.DepatureDate do
  use Ecto.Schema
  import Ecto.Changeset

  schema "package_depature_dates" do
    field :depature_date, :date
    field :is_available, :boolean, default: false
    field :slots_left, :integer
    field :package_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(depature_date, attrs) do
    depature_date
    |> cast(attrs, [:depature_date, :is_available, :slots_left])
    |> validate_required([:depature_date, :is_available, :slots_left])
  end
end
