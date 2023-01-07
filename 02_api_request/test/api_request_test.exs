defmodule ApiRequestTest do
  use ExUnit.Case
  doctest ApiRequest

  test "greets the world" do
    assert ApiRequest.hello() == :world
  end
end
