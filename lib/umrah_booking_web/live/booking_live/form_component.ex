defmodule UmrahBookingWeb.BookingLive.FormComponent do
  use UmrahBookingWeb, :live_component

  alias UmrahBooking.Bookings

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        {@title}
        <:subtitle>Use this form to manage booking records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="booking-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:deposit_amount]} type="number" label="Deposit amount" />
        <.input field={@form[:preferred_departure_date]} type="date" label="Preferred departure date" />
        <.input field={@form[:suggested_departure_date]} type="date" label="Suggested departure date" />
        <.input field={@form[:is_affordable]} type="checkbox" label="Is affordable" />
        <.input field={@form[:affordability_notes]} type="text" label="Affordability notes" />
        <.input field={@form[:booking_status]} type="text" label="Booking status" />
        <.input field={@form[:final_payment_due_date]} type="date" label="Final payment due date" />
        <.input field={@form[:approval_notes]} type="text" label="Approval notes" />
        <.input field={@form[:payment_completion_status]} type="text" label="Payment completion status" />
        <.input field={@form[:booking_reference]} type="text" label="Booking reference" />
        <.input field={@form[:payment_method]} type="text" label="Payment method" />
        <.input field={@form[:cancel_reason]} type="text" label="Cancel reason" />
        <.input field={@form[:reminder_sent]} type="checkbox" label="Reminder sent" />
        <.input field={@form[:created_at]} type="datetime-local" label="Created at" />
        <.input field={@form[:updated_at]} type="datetime-local" label="Updated at" />
        <.input field={@form[:deleted_ad]} type="datetime-local" label="Deleted ad" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Booking</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{booking: booking} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(Bookings.change_booking(booking))
     end)}
  end

  @impl true
  def handle_event("validate", %{"booking" => booking_params}, socket) do
    changeset = Bookings.change_booking(socket.assigns.booking, booking_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"booking" => booking_params}, socket) do
    save_booking(socket, socket.assigns.action, booking_params)
  end

  defp save_booking(socket, :edit, booking_params) do
    case Bookings.update_booking(socket.assigns.booking, booking_params) do
      {:ok, booking} ->
        notify_parent({:saved, booking})

        {:noreply,
         socket
         |> put_flash(:info, "Booking updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_booking(socket, :new, booking_params) do
    case Bookings.create_booking(booking_params) do
      {:ok, booking} ->
        notify_parent({:saved, booking})

        {:noreply,
         socket
         |> put_flash(:info, "Booking created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
