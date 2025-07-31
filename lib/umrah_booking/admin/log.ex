defmodule UmrahBooking.Admin.Log do
  use Ecto.Schema
  import Ecto.Changeset

  schema "admin_logs" do
    field :action, :string
    field :target_table, :string
    field :target_id, :integer
    field :notes, :string
    field :logged_at, :naive_datetime
    field :admin_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(log, attrs) do
    log
    |> cast(attrs, [:action, :target_table, :target_id, :notes, :logged_at])
    |> validate_required([:action, :target_table, :target_id, :notes, :logged_at])
  end
end
