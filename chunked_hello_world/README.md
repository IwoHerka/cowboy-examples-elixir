# Chunked hello world example

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

#### HTTP/1.1

```bash
$ curl -i localhost:4000
HTTP/1.1 200 OK
date: Sun, 13 Nov 2022 10:58:37 GMT
server: Cowboy
transfer-encoding: chunked

Hello
World
Chunked!
```

#### HTTP/2.0
```bash
$ curl -i --http2 localhost:4000
HTTP/1.1 101 Switching Protocols
connection: Upgrade
upgrade: h2c

HTTP/2 200
date: Sun, 13 Nov 2022 10:53:13 GMT
server: Cowboy

Hello
World
Chunked!
```
