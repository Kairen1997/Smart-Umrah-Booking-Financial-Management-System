defmodule UmrahBooking.Repo do
  use Ecto.Repo,
    otp_app: :umrah_booking,
    adapter: Ecto.Adapters.Postgres
end
