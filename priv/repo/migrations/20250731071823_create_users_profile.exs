defmodule UmrahBooking.Repo.Migrations.CreateUsersProfile do
  use Ecto.Migration

  def change do
    create table(:users_profile) do
      add :monthly_income, :integer
      add :IC_number, :string
      add :phone_number, :string
      add :gender, :string
      add :birthdate, :date
      add :address, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create unique_index(:users_profile, [:phone_number])
    create unique_index(:users_profile, [:IC_number])
    create index(:users_profile, [:user_id])
  end
end
