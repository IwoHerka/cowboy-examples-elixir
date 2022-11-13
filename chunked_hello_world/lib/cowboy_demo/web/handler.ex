defmodule CowboyDemo.Web.Handler do
  def init(req, _opts) do
    req = :cowboy_req.stream_reply(200, req)
    :timer.sleep(1000)
    :cowboy_req.stream_body("Hello\r\n", :nofin, req)
    :timer.sleep(1000)
    :cowboy_req.stream_body("World\r\n", :nofin, req)
    :timer.sleep(1000)
    :cowboy_req.stream_body("Chunked!\r\n", :fin, req)
    {:ok, req, :empty}
  end
end