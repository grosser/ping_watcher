# ping_watcher

checks connection in even intervals and reports status

```
ping-watcher localhost -c 10 -s 0.1
2/10: 0.037ms, failures: 0, average: 0.037ms
3/10: 0.047ms, failures: 0, average: 0.042ms
4/10: 0.046ms, failures: 0, average: 0.043ms
5/10: 0.046ms, failures: 0, average: 0.044ms
6/10: 0.046ms, failures: 0, average: 0.044ms
7/10: 0.047ms, failures: 0, average: 0.045ms
8/10: 0.047ms, failures: 0, average: 0.045ms
9/10: 0.044ms, failures: 0, average: 0.045ms
10/10: 0.079ms, failures: 0, average: 0.049ms
11/10: 0.047ms, failures: 0, average: 0.049ms
Excellent
```

TODO: compile for osx ... `crystal build bin/ping-watcher.cr --release --cross-compile --target "x86_64-macosx-darwin"`

## Installation

`crystal build bin/ping-watcher.cr --release`

## Usage

`ping-watcher google.com`

## Development

- TODO: setup travis
- `crystal spec` # run tests

```
docker build -t ping_watcher . 2>&1 >/dev/null &&
  docker run -it --rm ping_watcher crystal spec

```

## Author

[Michael Grosser](http://grosser.it)<br/>
michael@grosser.it<br/>
License: MIT<br/>
[![Build Status](https://travis-ci.org/grosser/ping_watcher.png)](https://travis-ci.org/grosser/ping_watcher)
