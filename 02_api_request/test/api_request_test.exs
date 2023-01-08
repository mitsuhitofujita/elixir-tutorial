defmodule ApiRequestTest do
  use ExUnit.Case
  # doctest ApiRequest

  setup do
    bypass = Bypass.open()
    {:ok, bypass: bypass}
  end

  test "When http status code is 200 return body", %{bypass: bypass} do
    res = ~s<{"hello": "world"}>

    Bypass.expect_once(bypass, fn conn ->
      Plug.Conn.resp(conn, 200, res)
    end)

    assert ApiRequest.with_gard("http://localhost:#{bypass.port}") == res
  end

  test "When http status code is 404 return not found message", %{bypass: bypass} do
    res = ~s<{"hello": "world"}>

    Bypass.expect_once(bypass, fn conn ->
      Plug.Conn.resp(conn, 404, res)
    end)

    assert ApiRequest.with_gard("http://localhost:#{bypass.port}") == "not found"
  end

  test "when http status code is 500 return server error message", %{bypass: bypass} do
    res = ~s<{"hello": "world"}>

    Bypass.expect_once(bypass, fn conn ->
      Plug.Conn.resp(conn, 500, res)
    end)

    assert ApiRequest.with_gard("http://localhost:#{bypass.port}") == "server error"
  end

  test "when http status code is 400 return server error message", %{bypass: bypass} do
    res = ~s<{"hello": "world"}>

    Bypass.expect_once(bypass, fn conn ->
      Plug.Conn.resp(conn, 400, res)
    end)

    assert ApiRequest.with_gard("http://localhost:#{bypass.port}") == "request error"
  end
end
