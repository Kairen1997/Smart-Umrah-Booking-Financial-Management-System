defmodule UmrahBookingWeb.FullPaymentPlanLive.FormComponent do
  use UmrahBookingWeb, :live_component

  alias UmrahBooking.Payments

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        {@title}
        <:subtitle>Use this form to manage full_payment_plan records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="full_payment_plan-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:total_price]} type="number" label="Total price" />
        <.input field={@form[:paid_at]} type="datetime-local" label="Paid at" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Full payment plan</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{full_payment_plan: full_payment_plan} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(Payments.change_full_payment_plan(full_payment_plan))
     end)}
  end

  @impl true
  def handle_event("validate", %{"full_payment_plan" => full_payment_plan_params}, socket) do
    changeset = Payments.change_full_payment_plan(socket.assigns.full_payment_plan, full_payment_plan_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"full_payment_plan" => full_payment_plan_params}, socket) do
    save_full_payment_plan(socket, socket.assigns.action, full_payment_plan_params)
  end

  defp save_full_payment_plan(socket, :edit, full_payment_plan_params) do
    case Payments.update_full_payment_plan(socket.assigns.full_payment_plan, full_payment_plan_params) do
      {:ok, full_payment_plan} ->
        notify_parent({:saved, full_payment_plan})

        {:noreply,
         socket
         |> put_flash(:info, "Full payment plan updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_full_payment_plan(socket, :new, full_payment_plan_params) do
    case Payments.create_full_payment_plan(full_payment_plan_params) do
      {:ok, full_payment_plan} ->
        notify_parent({:saved, full_payment_plan})

        {:noreply,
         socket
         |> put_flash(:info, "Full payment plan created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
