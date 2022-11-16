defmodule CowboyDemo.Web.Handler do
  def init(req, opts) do
    method = :cowboy_req.method(req)
    has_body? = :cowboy_req.has_body(req)
    req = maybe_echo(method, has_body?, req)
    {:ok, req, opts}
  end

  defp maybe_echo("POST", true, req) do
    {:ok, post_vals, req} = :cowboy_req.read_urlencoded_body(req)
    message = Map.get(post_vals |> Map.new, "echo", nil)
    echo(message, req)
  end

  defp maybe_echo("POST", false, req) do
    :cowboy_req.reply(400, %{}, "Missing body", req)
  end

  defp maybe_echo(_, _, req) do
    :cowboy_req.reply(405, req)
  end

  defp echo(nil, req) do
    :cowboy_req.reply(400, %{}, "Missing echo parameter", req)
  end

  defp echo(message, req) do
    :cowboy_req.reply(200, %{"content-type" => "text/plain; charset=utf-8"}, message, req)
  end
end
