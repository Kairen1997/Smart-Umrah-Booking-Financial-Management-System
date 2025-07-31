defmodule UmrahBookingWeb.BookingLiveTest do
  use UmrahBookingWeb.ConnCase

  import Phoenix.LiveViewTest
  import UmrahBooking.BookingsFixtures

  @create_attrs %{deposit_amount: 42, preferred_departure_date: "2025-07-30", suggested_departure_date: "2025-07-30", is_affordable: true, affordability_notes: "some affordability_notes", booking_status: "some booking_status", final_payment_due_date: "2025-07-30", approval_notes: "some approval_notes", payment_completion_status: "some payment_completion_status", booking_reference: "some booking_reference", payment_method: "some payment_method", cancel_reason: "some cancel_reason", reminder_sent: true, created_at: "2025-07-30T08:57:00", updated_at: "2025-07-30T08:57:00", deleted_ad: "2025-07-30T08:57:00"}
  @update_attrs %{deposit_amount: 43, preferred_departure_date: "2025-07-31", suggested_departure_date: "2025-07-31", is_affordable: false, affordability_notes: "some updated affordability_notes", booking_status: "some updated booking_status", final_payment_due_date: "2025-07-31", approval_notes: "some updated approval_notes", payment_completion_status: "some updated payment_completion_status", booking_reference: "some updated booking_reference", payment_method: "some updated payment_method", cancel_reason: "some updated cancel_reason", reminder_sent: false, created_at: "2025-07-31T08:57:00", updated_at: "2025-07-31T08:57:00", deleted_ad: "2025-07-31T08:57:00"}
  @invalid_attrs %{deposit_amount: nil, preferred_departure_date: nil, suggested_departure_date: nil, is_affordable: false, affordability_notes: nil, booking_status: nil, final_payment_due_date: nil, approval_notes: nil, payment_completion_status: nil, booking_reference: nil, payment_method: nil, cancel_reason: nil, reminder_sent: false, created_at: nil, updated_at: nil, deleted_ad: nil}

  defp create_booking(_) do
    booking = booking_fixture()
    %{booking: booking}
  end

  describe "Index" do
    setup [:create_booking]

    test "lists all bookings", %{conn: conn, booking: booking} do
      {:ok, _index_live, html} = live(conn, ~p"/bookings")

      assert html =~ "Listing Bookings"
      assert html =~ booking.affordability_notes
    end

    test "saves new booking", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/bookings")

      assert index_live |> element("a", "New Booking") |> render_click() =~
               "New Booking"

      assert_patch(index_live, ~p"/bookings/new")

      assert index_live
             |> form("#booking-form", booking: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#booking-form", booking: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/bookings")

      html = render(index_live)
      assert html =~ "Booking created successfully"
      assert html =~ "some affordability_notes"
    end

    test "updates booking in listing", %{conn: conn, booking: booking} do
      {:ok, index_live, _html} = live(conn, ~p"/bookings")

      assert index_live |> element("#bookings-#{booking.id} a", "Edit") |> render_click() =~
               "Edit Booking"

      assert_patch(index_live, ~p"/bookings/#{booking}/edit")

      assert index_live
             |> form("#booking-form", booking: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#booking-form", booking: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/bookings")

      html = render(index_live)
      assert html =~ "Booking updated successfully"
      assert html =~ "some updated affordability_notes"
    end

    test "deletes booking in listing", %{conn: conn, booking: booking} do
      {:ok, index_live, _html} = live(conn, ~p"/bookings")

      assert index_live |> element("#bookings-#{booking.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#bookings-#{booking.id}")
    end
  end

  describe "Show" do
    setup [:create_booking]

    test "displays booking", %{conn: conn, booking: booking} do
      {:ok, _show_live, html} = live(conn, ~p"/bookings/#{booking}")

      assert html =~ "Show Booking"
      assert html =~ booking.affordability_notes
    end

    test "updates booking within modal", %{conn: conn, booking: booking} do
      {:ok, show_live, _html} = live(conn, ~p"/bookings/#{booking}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Booking"

      assert_patch(show_live, ~p"/bookings/#{booking}/show/edit")

      assert show_live
             |> form("#booking-form", booking: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#booking-form", booking: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/bookings/#{booking}")

      html = render(show_live)
      assert html =~ "Booking updated successfully"
      assert html =~ "some updated affordability_notes"
    end
  end
end
