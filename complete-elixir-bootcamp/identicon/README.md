# Identicon

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `identicon` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:identicon, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/identicon>.

### Building the right Erlang version

This project needs [Elixir `1.6.x`](https://github.com/elixir-lang/elixir/releases/tag/v1.6.6), which is from june 2018… you can install it with [asdf](https://github.com/asdf-vm/asdf-elixir) without problems, as it's precompiled. Compiling the right version of Erlang with [asdf](https://github.com/asdf-vm/asdf-erlang/) is much more difficult, though.

In Arch linux I was only able to do it with the following command:

```console
KERL_CONFIGURE_OPTIONS="--without-javac --with-ssl=~/.openssl-1.1 --with-odbc=/var/lib/pacman/local/unixodbc-$(pacman -Q unixodbc | cut -d' ' -f2)" CC=gcc-9 asdf install erlang 21.3.8.24
```

Which required installing [openssl 1.1](https://github.com/asdf-vm/asdf-erlang/wiki#install-erlang-193-on-arch-linux), [unixodbc](https://archlinux.org/packages/core/x86_64/unixodbc/) and [gcc 9](https://github.com/asdf-vm/asdf-erlang/wiki#install-erlang-213817-on-arch-linux) to run and build successfully. I also downgraded [autoconf](https://archlinux.org/packages/core/any/autoconf/) from `2.72` to `2.69`, using the [downgrade tool](https://github.com/archlinux-downgrade/downgrade), but I can't be sure if that was strictly necessary.

