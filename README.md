# freeport

Get a free and open TCP port that is ready to use. Inspired by [FreePort](https://github.com/phayes/freeport).

[![GitHub release](https://img.shields.io/github/release/petoem/freeport.svg?style=flat-square)](https://github.com/petoem/freeport/releases)
[![Travis](https://img.shields.io/travis/petoem/freeport.svg?style=flat-square)](https://travis-ci.org/petoem/freeport)

## Installation

### Command Line

Download the executable from the release page or build from source with `shards build`.

### Library

Add this to your application's `shard.yml`:

```yaml
dependencies:
  freeport:
    github: petoem/freeport
    version: 0.1.0
```

## Usage

### Command Line

```bash
> freeport -h
Usage: freeport [arguments]
    -n, --newline                    Print port number with a newline
    -v, --version                    Output version information and exit
    -h, --help                       Show this help
```

### Library

```crystal
require "freeport"

# Returns a free TCP port, may raise an exception if no free ports are available.
FreePort.get

# Returns a free TCP port or `nil`.
FreePort.get?
```

## Limitation

`freeport` returns a port available at the moment, a race condition may occur and the port could be taken by the time you try binding to the port yourself.

## Contributing

1. [Fork it!](https://github.com/petoem/freeport/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Michael Petö](https://github.com/petoem) - creator and maintainer
