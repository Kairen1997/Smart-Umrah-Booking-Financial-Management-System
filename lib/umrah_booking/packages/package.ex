defmodule UmrahBooking.Packages.Package do
  use Ecto.Schema
  import Ecto.Changeset

  schema "packages" do
    field :description, :string
    field :package_name, :string
    field :package_price, :integer
    field :pacakge_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(package, attrs) do
    package
    |> cast(attrs, [:package_name, :package_price, :description])
    |> validate_required([:package_name, :package_price, :description])
  end
end
