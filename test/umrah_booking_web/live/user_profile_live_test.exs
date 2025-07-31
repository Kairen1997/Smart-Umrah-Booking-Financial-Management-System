defmodule UmrahBookingWeb.UserProfileLiveTest do
  use UmrahBookingWeb.ConnCase

  import Phoenix.LiveViewTest
  import UmrahBooking.AccountsFixtures

  @create_attrs %{address: "some address", monthly_income: 42, IC_number: "some IC_number", phone_number: "some phone_number", gender: "some gender", birthdate: "2025-07-30"}
  @update_attrs %{address: "some updated address", monthly_income: 43, IC_number: "some updated IC_number", phone_number: "some updated phone_number", gender: "some updated gender", birthdate: "2025-07-31"}
  @invalid_attrs %{address: nil, monthly_income: nil, IC_number: nil, phone_number: nil, gender: nil, birthdate: nil}

  defp create_user_profile(_) do
    user_profile = user_profile_fixture()
    %{user_profile: user_profile}
  end

  describe "Index" do
    setup [:create_user_profile]

    test "lists all users_profile", %{conn: conn, user_profile: user_profile} do
      {:ok, _index_live, html} = live(conn, ~p"/users_profile")

      assert html =~ "Listing Users profile"
      assert html =~ user_profile.address
    end

    test "saves new user_profile", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/users_profile")

      assert index_live |> element("a", "New User profile") |> render_click() =~
               "New User profile"

      assert_patch(index_live, ~p"/users_profile/new")

      assert index_live
             |> form("#user_profile-form", user_profile: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#user_profile-form", user_profile: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/users_profile")

      html = render(index_live)
      assert html =~ "User profile created successfully"
      assert html =~ "some address"
    end

    test "updates user_profile in listing", %{conn: conn, user_profile: user_profile} do
      {:ok, index_live, _html} = live(conn, ~p"/users_profile")

      assert index_live |> element("#users_profile-#{user_profile.id} a", "Edit") |> render_click() =~
               "Edit User profile"

      assert_patch(index_live, ~p"/users_profile/#{user_profile}/edit")

      assert index_live
             |> form("#user_profile-form", user_profile: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#user_profile-form", user_profile: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/users_profile")

      html = render(index_live)
      assert html =~ "User profile updated successfully"
      assert html =~ "some updated address"
    end

    test "deletes user_profile in listing", %{conn: conn, user_profile: user_profile} do
      {:ok, index_live, _html} = live(conn, ~p"/users_profile")

      assert index_live |> element("#users_profile-#{user_profile.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#users_profile-#{user_profile.id}")
    end
  end

  describe "Show" do
    setup [:create_user_profile]

    test "displays user_profile", %{conn: conn, user_profile: user_profile} do
      {:ok, _show_live, html} = live(conn, ~p"/users_profile/#{user_profile}")

      assert html =~ "Show User profile"
      assert html =~ user_profile.address
    end

    test "updates user_profile within modal", %{conn: conn, user_profile: user_profile} do
      {:ok, show_live, _html} = live(conn, ~p"/users_profile/#{user_profile}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit User profile"

      assert_patch(show_live, ~p"/users_profile/#{user_profile}/show/edit")

      assert show_live
             |> form("#user_profile-form", user_profile: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#user_profile-form", user_profile: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/users_profile/#{user_profile}")

      html = render(show_live)
      assert html =~ "User profile updated successfully"
      assert html =~ "some updated address"
    end
  end
end
