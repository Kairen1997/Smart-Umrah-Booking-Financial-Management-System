defmodule UmrahBooking.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      UmrahBookingWeb.Telemetry,
      UmrahBooking.Repo,
      {DNSCluster, query: Application.get_env(:umrah_booking, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: UmrahBooking.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: UmrahBooking.Finch},
      # Start a worker by calling: UmrahBooking.Worker.start_link(arg)
      # {UmrahBooking.Worker, arg},
      # Start to serve requests, typically the last entry
      UmrahBookingWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: UmrahBooking.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    UmrahBookingWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
