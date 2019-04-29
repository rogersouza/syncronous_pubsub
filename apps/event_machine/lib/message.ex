defmodule EventMachine.Message do
  @type t :: %__MODULE__{}
  @type event_name() :: Strint.t() | atom()
  @type topic() :: String.t() | atom()
  @type data() :: any()
  
  alias EventMachine.Message

  defstruct [:event_name, :topic, :data]
  
  @spec new(event_name(), topic(), data()) :: Messate.t()
  def new(event_name, topic, data) do
    %EventMachine.Message{}
    |> Map.put(:event_name, event_name)
    |> Map.put(:topic, topic)
    |> Map.put(:data, data)
  end
end
