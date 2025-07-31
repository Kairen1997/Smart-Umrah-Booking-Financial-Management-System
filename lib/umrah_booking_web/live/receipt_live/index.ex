defmodule UmrahBookingWeb.ReceiptLive.Index do
  use UmrahBookingWeb, :live_view

  alias UmrahBooking.Payments
  alias UmrahBooking.Payments.Receipt

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :receipts, Payments.list_receipts())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Receipt")
    |> assign(:receipt, Payments.get_receipt!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Receipt")
    |> assign(:receipt, %Receipt{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Receipts")
    |> assign(:receipt, nil)
  end

  @impl true
  def handle_info({UmrahBookingWeb.ReceiptLive.FormComponent, {:saved, receipt}}, socket) do
    {:noreply, stream_insert(socket, :receipts, receipt)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    receipt = Payments.get_receipt!(id)
    {:ok, _} = Payments.delete_receipt(receipt)

    {:noreply, stream_delete(socket, :receipts, receipt)}
  end
end
