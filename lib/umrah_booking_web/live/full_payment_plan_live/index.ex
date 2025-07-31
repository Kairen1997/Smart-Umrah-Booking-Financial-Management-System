defmodule UmrahBookingWeb.FullPaymentPlanLive.Index do
  use UmrahBookingWeb, :live_view

  alias UmrahBooking.Payments
  alias UmrahBooking.Payments.FullPaymentPlan

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :full_payments_plans, Payments.list_full_payments_plans())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Full payment plan")
    |> assign(:full_payment_plan, Payments.get_full_payment_plan!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Full payment plan")
    |> assign(:full_payment_plan, %FullPaymentPlan{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Full payments plans")
    |> assign(:full_payment_plan, nil)
  end

  @impl true
  def handle_info({UmrahBookingWeb.FullPaymentPlanLive.FormComponent, {:saved, full_payment_plan}}, socket) do
    {:noreply, stream_insert(socket, :full_payments_plans, full_payment_plan)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    full_payment_plan = Payments.get_full_payment_plan!(id)
    {:ok, _} = Payments.delete_full_payment_plan(full_payment_plan)

    {:noreply, stream_delete(socket, :full_payments_plans, full_payment_plan)}
  end
end
