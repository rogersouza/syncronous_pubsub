defmodule A do
  use EventMachine.Subscriber, topic: "unique_topic"
  
  @impl true
  def handle_event("unique_event", data) do
    IO.inspect("A.handle_event/2 called")
  end
end
