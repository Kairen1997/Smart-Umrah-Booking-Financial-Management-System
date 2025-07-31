defmodule UmrahBooking.AdminFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `UmrahBooking.Admin` context.
  """

  @doc """
  Generate a log.
  """
  def log_fixture(attrs \\ %{}) do
    {:ok, log} =
      attrs
      |> Enum.into(%{

      })
      |> UmrahBooking.Admin.create_log()

    log
  end

  @doc """
  Generate a setting.
  """
  def setting_fixture(attrs \\ %{}) do
    {:ok, setting} =
      attrs
      |> Enum.into(%{

      })
      |> UmrahBooking.Admin.create_setting()

    setting
  end
end
