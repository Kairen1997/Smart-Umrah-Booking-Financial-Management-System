defmodule UmrahBooking.BookingsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `UmrahBooking.Bookings` context.
  """

  @doc """
  Generate a booking.
  """
  def booking_fixture(attrs \\ %{}) do
    {:ok, booking} =
      attrs
      |> Enum.into(%{

      })
      |> UmrahBooking.Bookings.create_booking()

    booking
  end
end
