defmodule CowboyDemo.Web.Handler do

  def init(req, opts) do
    next_int = :erlang.integer_to_list(:rand.uniform(1000000))
    req = :cowboy_req.set_resp_cookie("server", next_int, req, %{path: "/"})

    %{client: client_cookie, server: server_cookie} =
      :cowboy_req.match_cookies([{:client, [], ""}, {:server, [], ""}], req)

    body = get_html(server_cookie, client_cookie)
    req = :cowboy_req.reply(200, %{"content-type" => "text/html"}, body, req)

    {:ok, req, opts}
  end

  defp get_html(server, client) do
    """
    <!DOCTYPE html>
    <html lang="en">
      <head>
            <meta charset="utf-8">
            <title>Cowboy Cookie Example</title>
          </head>
      <body>
        <h1>Cowboy Cookie Example</h1>
        <p>Refresh the page to see the next cookie.</p>

        <h2>Cookie set server-side</h2>
        <p>#{ server }</p>

        <h2>Cookie set client-side</h2>
        <p>#{ client }</p>

        <script type="text/javascript">
          document.cookie=`client=${Math.floor(Math.random() * 1000000)}`;
        </script>
      </body>
    </html>
    """
  end
end