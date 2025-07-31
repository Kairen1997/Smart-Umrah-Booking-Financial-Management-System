defmodule UmrahBookingWeb.Router do
  use UmrahBookingWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {UmrahBookingWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", UmrahBookingWeb do
    pipe_through :browser

    get "/", PageController, :home

    live "/users", UserLive.Index, :index
    live "/users/new", UserLive.Index, :new
    live "/users/:id/edit", UserLive.Index, :edit

    live "/users/:id", UserLive.Show, :show
    live "/users/:id/show/edit", UserLive.Show, :edit

    live "/users_profile", UserProfileLive.Index, :index
    live "/users_profile/new", UserProfileLive.Index, :new
    live "/users_profile/:id/edit", UserProfileLive.Index, :edit

    live "/users_profile/:id", UserProfileLive.Show, :show
    live "/users_profile/:id/show/edit", UserProfileLive.Show, :edit

    live "/bookings", BookingLive.Index, :index
    live "/bookings/new", BookingLive.Index, :new
    live "/bookings/:id/edit", BookingLive.Index, :edit

    live "/bookings/:id", BookingLive.Show, :show
    live "/bookings/:id/show/edit", BookingLive.Show, :edit

    live "/payments", PaymentLive.Index, :index
    live "/payments/new", PaymentLive.Index, :new
    live "/payments/:id/edit", PaymentLive.Index, :edit

    live "/payments/:id", PaymentLive.Show, :show
    live "/payments/:id/show/edit", PaymentLive.Show, :edit

    live "/installment_plans", InstallmentPlanLive.Index, :index
    live "/installment_plans/new", InstallmentPlanLive.Index, :new
    live "/installment_plans/:id/edit", InstallmentPlanLive.Index, :edit

    live "/installment_plans/:id", InstallmentPlanLive.Show, :show
    live "/installment_plans/:id/show/edit", InstallmentPlanLive.Show, :edit

    live "/full_payments_plans", FullPaymentPlanLive.Index, :index
    live "/full_payments_plans/new", FullPaymentPlanLive.Index, :new
    live "/full_payments_plans/:id/edit", FullPaymentPlanLive.Index, :edit

    live "/full_payments_plans/:id", FullPaymentPlanLive.Show, :show
    live "/full_payments_plans/:id/show/edit", FullPaymentPlanLive.Show, :edit

    live "/receipts", ReceiptLive.Index, :index
    live "/receipts/new", ReceiptLive.Index, :new
    live "/receipts/:id/edit", ReceiptLive.Index, :edit

    live "/receipts/:id", ReceiptLive.Show, :show
    live "/receipts/:id/show/edit", ReceiptLive.Show, :edit

  end



  # Other scopes may use custom stacks.
  # scope "/api", UmrahBookingWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:umrah_booking, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: UmrahBookingWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
