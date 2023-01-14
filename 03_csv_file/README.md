# CsvFile

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `csv_file` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:csv_file, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/csv_file>.

```
mix new csv_file
mv csv_file 03_csv_file
mix deps.get
mix run -e "IO.inspect CsvFile.read"
mix test
```