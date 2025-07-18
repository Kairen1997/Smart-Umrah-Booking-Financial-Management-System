defmodule UmrahBookingWeb.ErrorJSONTest do
  use UmrahBookingWeb.ConnCase, async: true

  test "renders 404" do
    assert UmrahBookingWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert UmrahBookingWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
