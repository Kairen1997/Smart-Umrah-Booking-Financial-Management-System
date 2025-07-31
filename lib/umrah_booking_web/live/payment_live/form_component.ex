defmodule UmrahBookingWeb.PaymentLive.FormComponent do
  use UmrahBookingWeb, :live_component

  alias UmrahBooking.Payments

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        {@title}
        <:subtitle>Use this form to manage payment records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="payment-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:amount]} type="number" label="Amount" />
        <.input field={@form[:payment_type]} type="text" label="Payment type" />
        <.input field={@form[:method]} type="text" label="Method" />
        <.input field={@form[:status]} type="text" label="Status" />
        <.input field={@form[:payment_date]} type="date" label="Payment date" />
        <.input field={@form[:reference_code]} type="text" label="Reference code" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Payment</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{payment: payment} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(Payments.change_payment(payment))
     end)}
  end

  @impl true
  def handle_event("validate", %{"payment" => payment_params}, socket) do
    changeset = Payments.change_payment(socket.assigns.payment, payment_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"payment" => payment_params}, socket) do
    save_payment(socket, socket.assigns.action, payment_params)
  end

  defp save_payment(socket, :edit, payment_params) do
    case Payments.update_payment(socket.assigns.payment, payment_params) do
      {:ok, payment} ->
        notify_parent({:saved, payment})

        {:noreply,
         socket
         |> put_flash(:info, "Payment updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_payment(socket, :new, payment_params) do
    case Payments.create_payment(payment_params) do
      {:ok, payment} ->
        notify_parent({:saved, payment})

        {:noreply,
         socket
         |> put_flash(:info, "Payment created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
