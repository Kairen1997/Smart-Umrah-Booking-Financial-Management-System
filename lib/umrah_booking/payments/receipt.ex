defmodule UmrahBooking.Payments.Receipt do
  use Ecto.Schema
  import Ecto.Changeset

  schema "recipts" do
    field :file_path, :string
    field :uploaded_at, :naive_datetime
    field :payment_status, :string

    belongs_to :payment, UmrahBooking.Payments.Payment

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(receipt, attrs) do
    receipt
    |> cast(attrs, [:file_path, :uploaded_at])
    |> validate_required([:file_path, :uploaded_at])
  end
end
