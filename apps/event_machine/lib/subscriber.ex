defmodule EventMachine.Subscriber do
  @type event_data() :: map()
  @type event_name() :: atom()

  @callback handle_event(event_name(), event_data()) :: any()

  defmacro __using__(topic: topic) do
    quote do
      use GenServer
      import EventMachine.Subscriber

      @behaviour EventMachine.Subscriber


      @impl true
      def init(state) do
        Registry.register(PubSub, unquote(topic), [])
        {:ok, state}
      end

      def start_link(state) do
        GenServer.start_link(__MODULE__, state)
      end

      @impl true
      def handle_cast({:event, event}, _state) do
        event_name = Map.get(event, :event_name)
        handle_event(event_name, event)

        {:noreply, []}
      end
    end
  end
end