defmodule UmrahBooking.Repo.Migrations.CreateRecipts do
  use Ecto.Migration

  def change do
    create table(:recipts) do
      add :file_path, :string
      add :uploaded_at, :naive_datetime
      add :payment_id, references(:payments, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:recipts, [:payment_id])
  end
end
