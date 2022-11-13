defmodule CowboyDemo.Web.Handler do
  def init(req, opts) do
    method = :cowboy_req.method(req)
    %{echo: echo_text} = :cowboy_req.match_qs([{:echo, [], nil}], req)
    req = echo(method, echo_text, req)
    {:ok, req, opts}
  end

  defp echo("GET", nil, req) do
    :cowboy_req.reply(400, %{}, "Missing echo parameter", req)
  end

  defp echo("GET", echo_text, req) do
    :cowboy_req.reply(200, %{"content-type" => "text/plain; charset=utf-8"}, echo_text, req)
  end

  defp echo(_, _, req) do
    :cowboy_req.reply(405, req)
  end
end