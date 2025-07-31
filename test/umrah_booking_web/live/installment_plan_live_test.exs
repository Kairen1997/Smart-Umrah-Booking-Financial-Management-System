defmodule UmrahBookingWeb.InstallmentPlanLiveTest do
  use UmrahBookingWeb.ConnCase

  import Phoenix.LiveViewTest
  import UmrahBooking.PaymentsFixtures

  @create_attrs %{balance: 42, total_price: 42, deposit: 42, monthly_installment: 42, months_needed: 42, start_date: "2025-07-30", completion_date: "2025-07-30", paid: true, next_due_date: "2025-07-30"}
  @update_attrs %{balance: 43, total_price: 43, deposit: 43, monthly_installment: 43, months_needed: 43, start_date: "2025-07-31", completion_date: "2025-07-31", paid: false, next_due_date: "2025-07-31"}
  @invalid_attrs %{balance: nil, total_price: nil, deposit: nil, monthly_installment: nil, months_needed: nil, start_date: nil, completion_date: nil, paid: false, next_due_date: nil}

  defp create_installment_plan(_) do
    installment_plan = installment_plan_fixture()
    %{installment_plan: installment_plan}
  end

  describe "Index" do
    setup [:create_installment_plan]

    test "lists all installment_plans", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, ~p"/installment_plans")

      assert html =~ "Listing Installment plans"
    end

    test "saves new installment_plan", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/installment_plans")

      assert index_live |> element("a", "New Installment plan") |> render_click() =~
               "New Installment plan"

      assert_patch(index_live, ~p"/installment_plans/new")

      assert index_live
             |> form("#installment_plan-form", installment_plan: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#installment_plan-form", installment_plan: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/installment_plans")

      html = render(index_live)
      assert html =~ "Installment plan created successfully"
    end

    test "updates installment_plan in listing", %{conn: conn, installment_plan: installment_plan} do
      {:ok, index_live, _html} = live(conn, ~p"/installment_plans")

      assert index_live |> element("#installment_plans-#{installment_plan.id} a", "Edit") |> render_click() =~
               "Edit Installment plan"

      assert_patch(index_live, ~p"/installment_plans/#{installment_plan}/edit")

      assert index_live
             |> form("#installment_plan-form", installment_plan: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#installment_plan-form", installment_plan: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/installment_plans")

      html = render(index_live)
      assert html =~ "Installment plan updated successfully"
    end

    test "deletes installment_plan in listing", %{conn: conn, installment_plan: installment_plan} do
      {:ok, index_live, _html} = live(conn, ~p"/installment_plans")

      assert index_live |> element("#installment_plans-#{installment_plan.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#installment_plans-#{installment_plan.id}")
    end
  end

  describe "Show" do
    setup [:create_installment_plan]

    test "displays installment_plan", %{conn: conn, installment_plan: installment_plan} do
      {:ok, _show_live, html} = live(conn, ~p"/installment_plans/#{installment_plan}")

      assert html =~ "Show Installment plan"
    end

    test "updates installment_plan within modal", %{conn: conn, installment_plan: installment_plan} do
      {:ok, show_live, _html} = live(conn, ~p"/installment_plans/#{installment_plan}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Installment plan"

      assert_patch(show_live, ~p"/installment_plans/#{installment_plan}/show/edit")

      assert show_live
             |> form("#installment_plan-form", installment_plan: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#installment_plan-form", installment_plan: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/installment_plans/#{installment_plan}")

      html = render(show_live)
      assert html =~ "Installment plan updated successfully"
    end
  end
end
