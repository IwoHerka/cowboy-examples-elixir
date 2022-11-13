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

  defp start_cowboy do
    dispatch = :cowboy_router.compile([
      {:_, [{"/", CowboyDemo.Web.Handler, []}]}
    ])

    case :cowboy.start_clear(
      :http,
      [{:port, 4000}],
      %{env: %{dispatch: dispatch}}
    ) do
      {:ok, _pid} -> IO.inspect {"Cowboy started", _pid}
      {:error, _error} -> IO.inspect {"Cowboy failed", _error}
    end
  end
end
