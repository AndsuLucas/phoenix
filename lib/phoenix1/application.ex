defmodule Phoenix1.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Phoenix1.Repo,
      # Start the Telemetry supervisor
      Phoenix1Web.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Phoenix1.PubSub},
      # Start the Endpoint (http/https)
      Phoenix1Web.Endpoint
      # Start a worker by calling: Phoenix1.Worker.start_link(arg)
      # {Phoenix1.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Phoenix1.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Phoenix1Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
