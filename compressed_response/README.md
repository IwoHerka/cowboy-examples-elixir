# Compressed response example

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

## Example output

### Without compression

```bash
$ curl -i localhost:4000
HTTP/1.1 200 OK
content-length: 920
date: Sun, 13 Nov 2022 11:05:54 GMT
server: Cowboy

A cowboy is an animal herder who tends cattle on ranches in North America,
traditionally on horseback, and often performs a multitude of other ranch-
related tasks. The historic American cowboy of the late 19th century arose
from the vaquero traditions of northern Mexico and became a figure of special
significance and legend. A subtype, called a wrangler, specifically tends the
horses used to work cattle. In addition to ranch work, some cowboys work for
or participate in rodeos. Cowgirls, first defined as such in the late 19th
century, had a less-well documented historical role, but in the modern world
have established the ability to work at virtually identical tasks and obtained
considerable respect for their achievements. There are also cattle handlers
in many other parts of the world, particularly South America and Australia,
who perform work similar to the cowboy in their respective nations.
```

### With compression

```bash
$ curl -i --compressed localhost:4000
HTTP/1.1 200 OK
content-encoding: gzip
content-length: 521
date: Sun, 13 Nov 2022 11:06:15 GMT
server: Cowboy

A cowboy is an animal herder who tends cattle on ranches in North America,
traditionally on horseback, and often performs a multitude of other ranch-
related tasks. The historic American cowboy of the late 19th century arose
from the vaquero traditions of northern Mexico and became a figure of special
significance and legend. A subtype, called a wrangler, specifically tends the
horses used to work cattle. In addition to ranch work, some cowboys work for
or participate in rodeos. Cowgirls, first defined as such in the late 19th
century, had a less-well documented historical role, but in the modern world
have established the ability to work at virtually identical tasks and obtained
considerable respect for their achievements. There are also cattle handlers
in many other parts of the world, particularly South America and Australia,
who perform work similar to the cowboy in their respective nations.
```