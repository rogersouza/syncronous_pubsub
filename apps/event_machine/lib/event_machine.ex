defmodule EventMachine do
  @type topic() :: atom() | String.t()
  @type event() ::  EventMachine.Message.t()

  @doc """
  Call all handlers that are listening to the `topic`
  """

  @spec publish(topic(), event()) :: :ok
  def publish(topic, event) do
    Registry.dispatch(PubSub, topic, fn entries ->
      for {pid, _} <- entries do
        GenServer.cast(pid, {:event, event})
      end
    end)

    :ok
  end
end
