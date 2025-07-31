defmodule UmrahBookingWeb.FullPaymentPlanLive.Show do
  use UmrahBookingWeb, :live_view

  alias UmrahBooking.Payments

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:full_payment_plan, Payments.get_full_payment_plan!(id))}
  end

  defp page_title(:show), do: "Show Full payment plan"
  defp page_title(:edit), do: "Edit Full payment plan"
end
