defmodule UmrahBookingWeb.FullPaymentPlanLiveTest do
  use UmrahBookingWeb.ConnCase

  import Phoenix.LiveViewTest
  import UmrahBooking.PaymentsFixtures

  @create_attrs %{total_price: 42, paid_at: "2025-07-30T09:00:00"}
  @update_attrs %{total_price: 43, paid_at: "2025-07-31T09:00:00"}
  @invalid_attrs %{total_price: nil, paid_at: nil}

  defp create_full_payment_plan(_) do
    full_payment_plan = full_payment_plan_fixture()
    %{full_payment_plan: full_payment_plan}
  end

  describe "Index" do
    setup [:create_full_payment_plan]

    test "lists all full_payments_plans", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, ~p"/full_payments_plans")

      assert html =~ "Listing Full payments plans"
    end

    test "saves new full_payment_plan", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/full_payments_plans")

      assert index_live |> element("a", "New Full payment plan") |> render_click() =~
               "New Full payment plan"

      assert_patch(index_live, ~p"/full_payments_plans/new")

      assert index_live
             |> form("#full_payment_plan-form", full_payment_plan: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#full_payment_plan-form", full_payment_plan: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/full_payments_plans")

      html = render(index_live)
      assert html =~ "Full payment plan created successfully"
    end

    test "updates full_payment_plan in listing", %{conn: conn, full_payment_plan: full_payment_plan} do
      {:ok, index_live, _html} = live(conn, ~p"/full_payments_plans")

      assert index_live |> element("#full_payments_plans-#{full_payment_plan.id} a", "Edit") |> render_click() =~
               "Edit Full payment plan"

      assert_patch(index_live, ~p"/full_payments_plans/#{full_payment_plan}/edit")

      assert index_live
             |> form("#full_payment_plan-form", full_payment_plan: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#full_payment_plan-form", full_payment_plan: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/full_payments_plans")

      html = render(index_live)
      assert html =~ "Full payment plan updated successfully"
    end

    test "deletes full_payment_plan in listing", %{conn: conn, full_payment_plan: full_payment_plan} do
      {:ok, index_live, _html} = live(conn, ~p"/full_payments_plans")

      assert index_live |> element("#full_payments_plans-#{full_payment_plan.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#full_payments_plans-#{full_payment_plan.id}")
    end
  end

  describe "Show" do
    setup [:create_full_payment_plan]

    test "displays full_payment_plan", %{conn: conn, full_payment_plan: full_payment_plan} do
      {:ok, _show_live, html} = live(conn, ~p"/full_payments_plans/#{full_payment_plan}")

      assert html =~ "Show Full payment plan"
    end

    test "updates full_payment_plan within modal", %{conn: conn, full_payment_plan: full_payment_plan} do
      {:ok, show_live, _html} = live(conn, ~p"/full_payments_plans/#{full_payment_plan}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Full payment plan"

      assert_patch(show_live, ~p"/full_payments_plans/#{full_payment_plan}/show/edit")

      assert show_live
             |> form("#full_payment_plan-form", full_payment_plan: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#full_payment_plan-form", full_payment_plan: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/full_payments_plans/#{full_payment_plan}")

      html = render(show_live)
      assert html =~ "Full payment plan updated successfully"
    end
  end
end
