defmodule CowboyDemo.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    start_cowboy()
    children = []
    opts = [strategy: :one_for_one, name: CowboyDemo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @impl true
  def stop(_state) do
    :ok = :cowboy.stop_listener(:http)
  end

  defp start_cowboy do
    dispatch = :cowboy_router.compile([
      {:_, [
        {"/eventsource", CowboyDemo.Web.Handler, []},
        {"/", :cowboy_static, {:priv_file, :cowboy_demo, "index.html"}}
      ]}
    ])

    case :cowboy.start_clear(:http, [{:port, 4000}], %{env: %{dispatch: dispatch}}) do
      {:ok, pid} -> IO.inspect {"Cowboy started", pid}
      {:error, error} -> IO.inspect {"Cowboy failed", error}
    end
  end
end
