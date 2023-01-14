defmodule CsvFileTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "chunk" do
    assert capture_io(fn ->
             CsvFile.chunk(Stream.map(["a,b,c\n", "c,d,e\n", "f,g,h"], & &1), 2)
           end) ==
             "2\na|b|c\nc|d|e\n1\nf|g|h\n"
  end
end
