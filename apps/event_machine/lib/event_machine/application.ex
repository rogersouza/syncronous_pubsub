defmodule EventMachine.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      {Registry, name: PubSub, partitions: System.schedulers_online(), keys: :duplicate}
      # Starts a worker by calling: EventMachine.Worker.start_link(arg)
      # {EventMachine.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: EventMachine.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
