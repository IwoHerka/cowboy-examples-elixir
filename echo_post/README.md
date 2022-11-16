# Echo POST example

To try this example run the following commands:

```bash
mix deps.get
iex -S mix
```

You can then tweak the code and run `recompile` in the shell.
Alternatively, if you don't want IEx:

```bash
mix deps.get
mix run --no-halt
```

### Example output

```bash
$ curl -i -d echo=hello-there http://localhost:4000
HTTP/1.1 200 OK
connection: keep-alive
server: Cowboy
date: Fri, 28 Sep 2012 04:12:36 GMT
content-length: 9
content-type: text/plain; charset=utf-8

hello-there
```

```bash
$ curl -i -d x=y http://localhost:4000
HTTP/1.1 400 Bad Request
content-length: 22
date: Wed, 16 Nov 2022 16:46:44 GMT
server: Cowboy

Missing echo parameter
```
