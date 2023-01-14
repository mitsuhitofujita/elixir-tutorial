defmodule CsvFile do
  @moduledoc """
  Documentation for `CsvFile`.
  """

  def process do
    "data.csv"
    |> File.stream!()
    |> CSV.decode!()
    |> Stream.map(&filter(&1))
    |> Stream.chunk_every(3)
    |> Stream.each(&print(&1))
    |> Enum.to_list()
  end

  defp filter(values) do
    IO.inspect("filter")
    values
  end

  defp print(values) do
    IO.inspect(values)
    Process.sleep(1000)
  end
end
