defmodule UmrahBooking.PaymentsTest do
  use UmrahBooking.DataCase

  alias UmrahBooking.Payments

  describe "payments" do
    alias UmrahBooking.Payments.Payment

    import UmrahBooking.PaymentsFixtures

    @invalid_attrs %{}

    test "list_payments/0 returns all payments" do
      payment = payment_fixture()
      assert Payments.list_payments() == [payment]
    end

    test "get_payment!/1 returns the payment with given id" do
      payment = payment_fixture()
      assert Payments.get_payment!(payment.id) == payment
    end

    test "create_payment/1 with valid data creates a payment" do
      valid_attrs = %{}

      assert {:ok, %Payment{} = payment} = Payments.create_payment(valid_attrs)
    end

    test "create_payment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Payments.create_payment(@invalid_attrs)
    end

    test "update_payment/2 with valid data updates the payment" do
      payment = payment_fixture()
      update_attrs = %{}

      assert {:ok, %Payment{} = payment} = Payments.update_payment(payment, update_attrs)
    end

    test "update_payment/2 with invalid data returns error changeset" do
      payment = payment_fixture()
      assert {:error, %Ecto.Changeset{}} = Payments.update_payment(payment, @invalid_attrs)
      assert payment == Payments.get_payment!(payment.id)
    end

    test "delete_payment/1 deletes the payment" do
      payment = payment_fixture()
      assert {:ok, %Payment{}} = Payments.delete_payment(payment)
      assert_raise Ecto.NoResultsError, fn -> Payments.get_payment!(payment.id) end
    end

    test "change_payment/1 returns a payment changeset" do
      payment = payment_fixture()
      assert %Ecto.Changeset{} = Payments.change_payment(payment)
    end
  end

  describe "installment_plans" do
    alias UmrahBooking.Payments.InstallmentPlan

    import UmrahBooking.PaymentsFixtures

    @invalid_attrs %{}

    test "list_installment_plans/0 returns all installment_plans" do
      installment_plan = installment_plan_fixture()
      assert Payments.list_installment_plans() == [installment_plan]
    end

    test "get_installment_plan!/1 returns the installment_plan with given id" do
      installment_plan = installment_plan_fixture()
      assert Payments.get_installment_plan!(installment_plan.id) == installment_plan
    end

    test "create_installment_plan/1 with valid data creates a installment_plan" do
      valid_attrs = %{}

      assert {:ok, %InstallmentPlan{} = installment_plan} = Payments.create_installment_plan(valid_attrs)
    end

    test "create_installment_plan/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Payments.create_installment_plan(@invalid_attrs)
    end

    test "update_installment_plan/2 with valid data updates the installment_plan" do
      installment_plan = installment_plan_fixture()
      update_attrs = %{}

      assert {:ok, %InstallmentPlan{} = installment_plan} = Payments.update_installment_plan(installment_plan, update_attrs)
    end

    test "update_installment_plan/2 with invalid data returns error changeset" do
      installment_plan = installment_plan_fixture()
      assert {:error, %Ecto.Changeset{}} = Payments.update_installment_plan(installment_plan, @invalid_attrs)
      assert installment_plan == Payments.get_installment_plan!(installment_plan.id)
    end

    test "delete_installment_plan/1 deletes the installment_plan" do
      installment_plan = installment_plan_fixture()
      assert {:ok, %InstallmentPlan{}} = Payments.delete_installment_plan(installment_plan)
      assert_raise Ecto.NoResultsError, fn -> Payments.get_installment_plan!(installment_plan.id) end
    end

    test "change_installment_plan/1 returns a installment_plan changeset" do
      installment_plan = installment_plan_fixture()
      assert %Ecto.Changeset{} = Payments.change_installment_plan(installment_plan)
    end
  end

  describe "full_payments_plans" do
    alias UmrahBooking.Payments.FullPaymentPlan

    import UmrahBooking.PaymentsFixtures

    @invalid_attrs %{}

    test "list_full_payments_plans/0 returns all full_payments_plans" do
      full_payment_plan = full_payment_plan_fixture()
      assert Payments.list_full_payments_plans() == [full_payment_plan]
    end

    test "get_full_payment_plan!/1 returns the full_payment_plan with given id" do
      full_payment_plan = full_payment_plan_fixture()
      assert Payments.get_full_payment_plan!(full_payment_plan.id) == full_payment_plan
    end

    test "create_full_payment_plan/1 with valid data creates a full_payment_plan" do
      valid_attrs = %{}

      assert {:ok, %FullPaymentPlan{} = full_payment_plan} = Payments.create_full_payment_plan(valid_attrs)
    end

    test "create_full_payment_plan/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Payments.create_full_payment_plan(@invalid_attrs)
    end

    test "update_full_payment_plan/2 with valid data updates the full_payment_plan" do
      full_payment_plan = full_payment_plan_fixture()
      update_attrs = %{}

      assert {:ok, %FullPaymentPlan{} = full_payment_plan} = Payments.update_full_payment_plan(full_payment_plan, update_attrs)
    end

    test "update_full_payment_plan/2 with invalid data returns error changeset" do
      full_payment_plan = full_payment_plan_fixture()
      assert {:error, %Ecto.Changeset{}} = Payments.update_full_payment_plan(full_payment_plan, @invalid_attrs)
      assert full_payment_plan == Payments.get_full_payment_plan!(full_payment_plan.id)
    end

    test "delete_full_payment_plan/1 deletes the full_payment_plan" do
      full_payment_plan = full_payment_plan_fixture()
      assert {:ok, %FullPaymentPlan{}} = Payments.delete_full_payment_plan(full_payment_plan)
      assert_raise Ecto.NoResultsError, fn -> Payments.get_full_payment_plan!(full_payment_plan.id) end
    end

    test "change_full_payment_plan/1 returns a full_payment_plan changeset" do
      full_payment_plan = full_payment_plan_fixture()
      assert %Ecto.Changeset{} = Payments.change_full_payment_plan(full_payment_plan)
    end
  end

  describe "receipts" do
    alias UmrahBooking.Payments.Receipt

    import UmrahBooking.PaymentsFixtures

    @invalid_attrs %{}

    test "list_receipts/0 returns all receipts" do
      receipt = receipt_fixture()
      assert Payments.list_receipts() == [receipt]
    end

    test "get_receipt!/1 returns the receipt with given id" do
      receipt = receipt_fixture()
      assert Payments.get_receipt!(receipt.id) == receipt
    end

    test "create_receipt/1 with valid data creates a receipt" do
      valid_attrs = %{}

      assert {:ok, %Receipt{} = receipt} = Payments.create_receipt(valid_attrs)
    end

    test "create_receipt/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Payments.create_receipt(@invalid_attrs)
    end

    test "update_receipt/2 with valid data updates the receipt" do
      receipt = receipt_fixture()
      update_attrs = %{}

      assert {:ok, %Receipt{} = receipt} = Payments.update_receipt(receipt, update_attrs)
    end

    test "update_receipt/2 with invalid data returns error changeset" do
      receipt = receipt_fixture()
      assert {:error, %Ecto.Changeset{}} = Payments.update_receipt(receipt, @invalid_attrs)
      assert receipt == Payments.get_receipt!(receipt.id)
    end

    test "delete_receipt/1 deletes the receipt" do
      receipt = receipt_fixture()
      assert {:ok, %Receipt{}} = Payments.delete_receipt(receipt)
      assert_raise Ecto.NoResultsError, fn -> Payments.get_receipt!(receipt.id) end
    end

    test "change_receipt/1 returns a receipt changeset" do
      receipt = receipt_fixture()
      assert %Ecto.Changeset{} = Payments.change_receipt(receipt)
    end
  end
end
