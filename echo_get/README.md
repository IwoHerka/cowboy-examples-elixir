# Echo GET example

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
$ curl -i localhost:4000/?echo=well-hello-there
HTTP/1.1 200 OK
content-length: 15
content-type: text/plain; charset=UTF-8
date: Sun, 13 Nov 2022 13:19:54 GMT
server: Cowboy

well-hello-there
```