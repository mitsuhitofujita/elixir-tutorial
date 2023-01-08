defmodule ApiRequest do
  @moduledoc """
  Documentation for `ApiRequest`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ApiRequest.hello()
      :world

  """
  def hello do
    # Simple
    #
    # Req.get!("https://wttr.in/?format=j1").body

    # Get
    #
    # %Req.Response{status: 400, body: body} = Req.get!("https://wttr.in/?format=j1")
    # body

    # Return message when error
    #
    body(Req.get!("https://wttr.in/?format=j1"))
  end

  def body(%Req.Response{status: 200, body: body}) do
    body
  end

  def body(%Req.Response{status: 404}) do
    "not found"
  end

  def body(%Req.Response{status: status_code}) when status_code >= 500 do
    "server error"
  end

  def body(%Req.Response{status: status_code}) when status_code >= 400 do
    "request error"
  end
end
