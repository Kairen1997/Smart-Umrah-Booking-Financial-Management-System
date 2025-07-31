defmodule UmrahBooking.PaymentsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `UmrahBooking.Payments` context.
  """

  @doc """
  Generate a payment.
  """
  def payment_fixture(attrs \\ %{}) do
    {:ok, payment} =
      attrs
      |> Enum.into(%{

      })
      |> UmrahBooking.Payments.create_payment()

    payment
  end

  @doc """
  Generate a installment_plan.
  """
  def installment_plan_fixture(attrs \\ %{}) do
    {:ok, installment_plan} =
      attrs
      |> Enum.into(%{

      })
      |> UmrahBooking.Payments.create_installment_plan()

    installment_plan
  end

  @doc """
  Generate a full_payment_plan.
  """
  def full_payment_plan_fixture(attrs \\ %{}) do
    {:ok, full_payment_plan} =
      attrs
      |> Enum.into(%{

      })
      |> UmrahBooking.Payments.create_full_payment_plan()

    full_payment_plan
  end

  @doc """
  Generate a receipt.
  """
  def receipt_fixture(attrs \\ %{}) do
    {:ok, receipt} =
      attrs
      |> Enum.into(%{

      })
      |> UmrahBooking.Payments.create_receipt()

    receipt
  end
end
