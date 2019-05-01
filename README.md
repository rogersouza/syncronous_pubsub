# EventMachine

## Implementing a subscriber
```elixir
defmodule MyApp.MySubscriber do
  use EventMachine.Subscriber, topic: "unique_topic"
  
  @impl true
  def handle_event("unique_event", data) do
    IO.inspect("MyApp.MySubscriber.handle_event/2 called")
  end
end
```

## Emmiting an event
#### To emmit an event, use `EventMachine.publish/2`
```elixir
# To "start" our subscribers, we have to either add it to our app's application.ex
# or start it manually by calling GenServer.start_link(OurSubscriber, [])

iex> alias EventMachine.Message
iex> event_message = Message.new("unique_event", "unique_topic", data: %{user: "user123"})
iex> EventMachine.publish("unique_topic", event_message)
MyApp.MySubscriber.handle_event/2 called
:ok
```
