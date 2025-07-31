defmodule UmrahBookingWeb.InstallmentPlanLive.Index do
  use UmrahBookingWeb, :live_view

  alias UmrahBooking.Payments
  alias UmrahBooking.Payments.InstallmentPlan

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :installment_plans, Payments.list_installment_plans())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Installment plan")
    |> assign(:installment_plan, Payments.get_installment_plan!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Installment plan")
    |> assign(:installment_plan, %InstallmentPlan{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Installment plans")
    |> assign(:installment_plan, nil)
  end

  @impl true
  def handle_info({UmrahBookingWeb.InstallmentPlanLive.FormComponent, {:saved, installment_plan}}, socket) do
    {:noreply, stream_insert(socket, :installment_plans, installment_plan)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    installment_plan = Payments.get_installment_plan!(id)
    {:ok, _} = Payments.delete_installment_plan(installment_plan)

    {:noreply, stream_delete(socket, :installment_plans, installment_plan)}
  end
end
