defmodule UmrahBooking.Payments do
  @moduledoc """
  The Payments context.
  """

  import Ecto.Query, warn: false
  alias UmrahBooking.Repo

  alias UmrahBooking.Payments.Payment

  @doc """
  Returns the list of payments.

  ## Examples

      iex> list_payments()
      [%Payment{}, ...]

  """
  def list_payments do
    raise "TODO"
  end

  @doc """
  Gets a single payment.

  Raises if the Payment does not exist.

  ## Examples

      iex> get_payment!(123)
      %Payment{}

  """
  def get_payment!(id), do: raise "TODO"

  @doc """
  Creates a payment.

  ## Examples

      iex> create_payment(%{field: value})
      {:ok, %Payment{}}

      iex> create_payment(%{field: bad_value})
      {:error, ...}

  """
  def create_payment(attrs \\ %{}) do
    raise "TODO"
  end

  @doc """
  Updates a payment.

  ## Examples

      iex> update_payment(payment, %{field: new_value})
      {:ok, %Payment{}}

      iex> update_payment(payment, %{field: bad_value})
      {:error, ...}

  """
  def update_payment(%Payment{} = payment, attrs) do
    raise "TODO"
  end

  @doc """
  Deletes a Payment.

  ## Examples

      iex> delete_payment(payment)
      {:ok, %Payment{}}

      iex> delete_payment(payment)
      {:error, ...}

  """
  def delete_payment(%Payment{} = payment) do
    raise "TODO"
  end

  @doc """
  Returns a data structure for tracking payment changes.

  ## Examples

      iex> change_payment(payment)
      %Todo{...}

  """
  def change_payment(%Payment{} = payment, _attrs \\ %{}) do
    raise "TODO"
  end

  alias UmrahBooking.Payments.InstallmentPlan

  @doc """
  Returns the list of installment_plans.

  ## Examples

      iex> list_installment_plans()
      [%InstallmentPlan{}, ...]

  """
  def list_installment_plans do
    raise "TODO"
  end

  @doc """
  Gets a single installment_plan.

  Raises if the Installment plan does not exist.

  ## Examples

      iex> get_installment_plan!(123)
      %InstallmentPlan{}

  """
  def get_installment_plan!(id), do: raise "TODO"

  @doc """
  Creates a installment_plan.

  ## Examples

      iex> create_installment_plan(%{field: value})
      {:ok, %InstallmentPlan{}}

      iex> create_installment_plan(%{field: bad_value})
      {:error, ...}

  """
  def create_installment_plan(attrs \\ %{}) do
    raise "TODO"
  end

  @doc """
  Updates a installment_plan.

  ## Examples

      iex> update_installment_plan(installment_plan, %{field: new_value})
      {:ok, %InstallmentPlan{}}

      iex> update_installment_plan(installment_plan, %{field: bad_value})
      {:error, ...}

  """
  def update_installment_plan(%InstallmentPlan{} = installment_plan, attrs) do
    raise "TODO"
  end

  @doc """
  Deletes a InstallmentPlan.

  ## Examples

      iex> delete_installment_plan(installment_plan)
      {:ok, %InstallmentPlan{}}

      iex> delete_installment_plan(installment_plan)
      {:error, ...}

  """
  def delete_installment_plan(%InstallmentPlan{} = installment_plan) do
    raise "TODO"
  end

  @doc """
  Returns a data structure for tracking installment_plan changes.

  ## Examples

      iex> change_installment_plan(installment_plan)
      %Todo{...}

  """
  def change_installment_plan(%InstallmentPlan{} = installment_plan, _attrs \\ %{}) do
    raise "TODO"
  end

  alias UmrahBooking.Payments.FullPaymentPlan

  @doc """
  Returns the list of full_payments_plans.

  ## Examples

      iex> list_full_payments_plans()
      [%FullPaymentPlan{}, ...]

  """
  def list_full_payments_plans do
    raise "TODO"
  end

  @doc """
  Gets a single full_payment_plan.

  Raises if the Full payment plan does not exist.

  ## Examples

      iex> get_full_payment_plan!(123)
      %FullPaymentPlan{}

  """
  def get_full_payment_plan!(id), do: raise "TODO"

  @doc """
  Creates a full_payment_plan.

  ## Examples

      iex> create_full_payment_plan(%{field: value})
      {:ok, %FullPaymentPlan{}}

      iex> create_full_payment_plan(%{field: bad_value})
      {:error, ...}

  """
  def create_full_payment_plan(attrs \\ %{}) do
    raise "TODO"
  end

  @doc """
  Updates a full_payment_plan.

  ## Examples

      iex> update_full_payment_plan(full_payment_plan, %{field: new_value})
      {:ok, %FullPaymentPlan{}}

      iex> update_full_payment_plan(full_payment_plan, %{field: bad_value})
      {:error, ...}

  """
  def update_full_payment_plan(%FullPaymentPlan{} = full_payment_plan, attrs) do
    raise "TODO"
  end

  @doc """
  Deletes a FullPaymentPlan.

  ## Examples

      iex> delete_full_payment_plan(full_payment_plan)
      {:ok, %FullPaymentPlan{}}

      iex> delete_full_payment_plan(full_payment_plan)
      {:error, ...}

  """
  def delete_full_payment_plan(%FullPaymentPlan{} = full_payment_plan) do
    raise "TODO"
  end

  @doc """
  Returns a data structure for tracking full_payment_plan changes.

  ## Examples

      iex> change_full_payment_plan(full_payment_plan)
      %Todo{...}

  """
  def change_full_payment_plan(%FullPaymentPlan{} = full_payment_plan, _attrs \\ %{}) do
    raise "TODO"
  end

  alias UmrahBooking.Payments.Receipt

  @doc """
  Returns the list of receipts.

  ## Examples

      iex> list_receipts()
      [%Receipt{}, ...]

  """
  def list_receipts do
    raise "TODO"
  end

  @doc """
  Gets a single receipt.

  Raises if the Receipt does not exist.

  ## Examples

      iex> get_receipt!(123)
      %Receipt{}

  """
  def get_receipt!(id), do: raise "TODO"

  @doc """
  Creates a receipt.

  ## Examples

      iex> create_receipt(%{field: value})
      {:ok, %Receipt{}}

      iex> create_receipt(%{field: bad_value})
      {:error, ...}

  """
  def create_receipt(attrs \\ %{}) do
    raise "TODO"
  end

  @doc """
  Updates a receipt.

  ## Examples

      iex> update_receipt(receipt, %{field: new_value})
      {:ok, %Receipt{}}

      iex> update_receipt(receipt, %{field: bad_value})
      {:error, ...}

  """
  def update_receipt(%Receipt{} = receipt, attrs) do
    raise "TODO"
  end

  @doc """
  Deletes a Receipt.

  ## Examples

      iex> delete_receipt(receipt)
      {:ok, %Receipt{}}

      iex> delete_receipt(receipt)
      {:error, ...}

  """
  def delete_receipt(%Receipt{} = receipt) do
    raise "TODO"
  end

  @doc """
  Returns a data structure for tracking receipt changes.

  ## Examples

      iex> change_receipt(receipt)
      %Todo{...}

  """
  def change_receipt(%Receipt{} = receipt, _attrs \\ %{}) do
    raise "TODO"
  end
end
