defmodule ApiRequest do
  @moduledoc """
  Documentation for `ApiRequest`.
  """

  def simple(url \\ "https://wttr.in/?format=j1") do
    Req.get!(url).body
  end

  def with_response(url \\ "https://wttr.in/?format=j1") do
    %Req.Response{status: 400, body: body} = Req.get!(url)
    body
  end

  @doc """
  Hello world.

  ## Examples

      iex> ApiRequest.hello()
      :world

  """
  def with_gard(url \\ "https://wttr.in/?format=j1") do
    # Return message when error
    #
    Req.get!(url, retry: false)
    |> body
  end

  defp body(%Req.Response{status: 200, body: body}) do
    body
  end

  defp body(%Req.Response{status: 404}) do
    "not found"
  end

  defp body(%Req.Response{status: status_code}) when status_code >= 500 do
    "server error"
  end

  defp body(%Req.Response{status: status_code}) when status_code >= 400 do
    "request error"
  end
end
