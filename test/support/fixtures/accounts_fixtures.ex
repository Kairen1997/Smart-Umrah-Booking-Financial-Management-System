defmodule UmrahBooking.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `UmrahBooking.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{

      })
      |> UmrahBooking.Accounts.create_user()

    user
  end

  @doc """
  Generate a user_profile.
  """
  def user_profile_fixture(attrs \\ %{}) do
    {:ok, user_profile} =
      attrs
      |> Enum.into(%{

      })
      |> UmrahBooking.Accounts.create_user_profile()

    user_profile
  end
end
