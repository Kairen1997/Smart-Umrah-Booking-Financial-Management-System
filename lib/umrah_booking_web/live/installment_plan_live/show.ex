defmodule UmrahBookingWeb.InstallmentPlanLive.Show do
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
     |> assign(:installment_plan, Payments.get_installment_plan!(id))}
  end

  defp page_title(:show), do: "Show Installment plan"
  defp page_title(:edit), do: "Edit Installment plan"
end
