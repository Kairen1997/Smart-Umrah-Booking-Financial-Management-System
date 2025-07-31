defmodule UmrahBooking.Bookings do
  @moduledoc """
  The Bookings context.
  """

  import Ecto.Query, warn: false
  alias UmrahBooking.Repo

  alias UmrahBooking.Bookings.Booking

  @doc """
  Returns the list of bookings.

  ## Examples

      iex> list_bookings()
      [%Booking{}, ...]

  """
  def list_bookings do
    raise "TODO"
  end

  @doc """
  Gets a single booking.

  Raises if the Booking does not exist.

  ## Examples

      iex> get_booking!(123)
      %Booking{}

  """
  def get_booking!(id), do: raise "TODO"

  @doc """
  Creates a booking.

  ## Examples

      iex> create_booking(%{field: value})
      {:ok, %Booking{}}

      iex> create_booking(%{field: bad_value})
      {:error, ...}

  """
  def create_booking(attrs \\ %{}) do
    raise "TODO"
  end

  @doc """
  Updates a booking.

  ## Examples

      iex> update_booking(booking, %{field: new_value})
      {:ok, %Booking{}}

      iex> update_booking(booking, %{field: bad_value})
      {:error, ...}

  """
  def update_booking(%Booking{} = booking, attrs) do
    raise "TODO"
  end

  @doc """
  Deletes a Booking.

  ## Examples

      iex> delete_booking(booking)
      {:ok, %Booking{}}

      iex> delete_booking(booking)
      {:error, ...}

  """
  def delete_booking(%Booking{} = booking) do
    raise "TODO"
  end

  @doc """
  Returns a data structure for tracking booking changes.

  ## Examples

      iex> change_booking(booking)
      %Todo{...}

  """
  def change_booking(%Booking{} = booking, _attrs \\ %{}) do
    raise "TODO"
  end
end
