defmodule CsvFile do
  @moduledoc """
  Documentation for `CsvFile`.
  """

  def read do
    "data.csv"
    |> File.stream!()
    |> chunk(5)
  end

  def chunk(stream, count) do
    stream
    |> CSV.decode!()
    |> Stream.map(&filter/1)
    |> Stream.chunk_every(count)
    |> Enum.each(&print/1)
  end

  defp filter(values) do
    values
  end

  defp print(lines) do
    IO.puts(Enum.count(lines))

    lines
    |> Enum.map(fn values -> Enum.join(values, "|") end)
    |> Enum.join("\n")
    |> IO.puts()
  end
end
