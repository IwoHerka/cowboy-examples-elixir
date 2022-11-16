defmodule CowboyDemo.Web.Handler do
  def init(req, opts) do
    req = :cowboy_req.stream_reply(200, %{"content-type" => "text/event-stream"}, req)
    :erlang.send_after(1000, self(), {:message, "Tick"})
    {:cowboy_loop, req, opts}
  end

  def info({:message, msg}, req, state) do
    :cowboy_req.stream_events(%{id: id(), data: msg}, :nofin, req)
    :erlang.send_after(1000, self(), {:message, "Tick"})
    {:ok, req, state}
  end

  def id, do: :erlang.integer_to_list(:erlang.unique_integer([:positive, :monotonic]), 16)
end