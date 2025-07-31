defmodule UmrahBookingWeb.ReceiptLive.Show do
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
     |> assign(:receipt, Payments.get_receipt!(id))}
  end

  defp page_title(:show), do: "Show Receipt"
  defp page_title(:edit), do: "Edit Receipt"
end
