defmodule UmrahBookingWeb.InstallmentPlanLive.FormComponent do
  use UmrahBookingWeb, :live_component

  alias UmrahBooking.Payments

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        {@title}
        <:subtitle>Use this form to manage installment_plan records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="installment_plan-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:total_price]} type="number" label="Total price" />
        <.input field={@form[:deposit]} type="number" label="Deposit" />
        <.input field={@form[:balance]} type="number" label="Balance" />
        <.input field={@form[:monthly_installment]} type="number" label="Monthly installment" />
        <.input field={@form[:months_needed]} type="number" label="Months needed" />
        <.input field={@form[:start_date]} type="date" label="Start date" />
        <.input field={@form[:completion_date]} type="date" label="Completion date" />
        <.input field={@form[:paid]} type="checkbox" label="Paid" />
        <.input field={@form[:next_due_date]} type="date" label="Next due date" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Installment plan</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{installment_plan: installment_plan} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(Payments.change_installment_plan(installment_plan))
     end)}
  end

  @impl true
  def handle_event("validate", %{"installment_plan" => installment_plan_params}, socket) do
    changeset = Payments.change_installment_plan(socket.assigns.installment_plan, installment_plan_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"installment_plan" => installment_plan_params}, socket) do
    save_installment_plan(socket, socket.assigns.action, installment_plan_params)
  end

  defp save_installment_plan(socket, :edit, installment_plan_params) do
    case Payments.update_installment_plan(socket.assigns.installment_plan, installment_plan_params) do
      {:ok, installment_plan} ->
        notify_parent({:saved, installment_plan})

        {:noreply,
         socket
         |> put_flash(:info, "Installment plan updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_installment_plan(socket, :new, installment_plan_params) do
    case Payments.create_installment_plan(installment_plan_params) do
      {:ok, installment_plan} ->
        notify_parent({:saved, installment_plan})

        {:noreply,
         socket
         |> put_flash(:info, "Installment plan created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
