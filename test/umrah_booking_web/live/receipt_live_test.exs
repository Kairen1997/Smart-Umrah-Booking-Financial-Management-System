defmodule UmrahBookingWeb.ReceiptLiveTest do
  use UmrahBookingWeb.ConnCase

  import Phoenix.LiveViewTest
  import UmrahBooking.PaymentsFixtures

  @create_attrs %{file_path: "some file_path", uploaded_at: "2025-07-30T09:01:00"}
  @update_attrs %{file_path: "some updated file_path", uploaded_at: "2025-07-31T09:01:00"}
  @invalid_attrs %{file_path: nil, uploaded_at: nil}

  defp create_receipt(_) do
    receipt = receipt_fixture()
    %{receipt: receipt}
  end

  describe "Index" do
    setup [:create_receipt]

    test "lists all receipts", %{conn: conn, receipt: receipt} do
      {:ok, _index_live, html} = live(conn, ~p"/receipts")

      assert html =~ "Listing Receipts"
      assert html =~ receipt.file_path
    end

    test "saves new receipt", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/receipts")

      assert index_live |> element("a", "New Receipt") |> render_click() =~
               "New Receipt"

      assert_patch(index_live, ~p"/receipts/new")

      assert index_live
             |> form("#receipt-form", receipt: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#receipt-form", receipt: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/receipts")

      html = render(index_live)
      assert html =~ "Receipt created successfully"
      assert html =~ "some file_path"
    end

    test "updates receipt in listing", %{conn: conn, receipt: receipt} do
      {:ok, index_live, _html} = live(conn, ~p"/receipts")

      assert index_live |> element("#receipts-#{receipt.id} a", "Edit") |> render_click() =~
               "Edit Receipt"

      assert_patch(index_live, ~p"/receipts/#{receipt}/edit")

      assert index_live
             |> form("#receipt-form", receipt: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#receipt-form", receipt: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/receipts")

      html = render(index_live)
      assert html =~ "Receipt updated successfully"
      assert html =~ "some updated file_path"
    end

    test "deletes receipt in listing", %{conn: conn, receipt: receipt} do
      {:ok, index_live, _html} = live(conn, ~p"/receipts")

      assert index_live |> element("#receipts-#{receipt.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#receipts-#{receipt.id}")
    end
  end

  describe "Show" do
    setup [:create_receipt]

    test "displays receipt", %{conn: conn, receipt: receipt} do
      {:ok, _show_live, html} = live(conn, ~p"/receipts/#{receipt}")

      assert html =~ "Show Receipt"
      assert html =~ receipt.file_path
    end

    test "updates receipt within modal", %{conn: conn, receipt: receipt} do
      {:ok, show_live, _html} = live(conn, ~p"/receipts/#{receipt}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Receipt"

      assert_patch(show_live, ~p"/receipts/#{receipt}/show/edit")

      assert show_live
             |> form("#receipt-form", receipt: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#receipt-form", receipt: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/receipts/#{receipt}")

      html = render(show_live)
      assert html =~ "Receipt updated successfully"
      assert html =~ "some updated file_path"
    end
  end
end
