defmodule Phoenix1Web.HelloController do
  use Phoenix1Web, :controller

  @fake_ids [3,6,7]

  plug Phoenix1Web.Plugs.Locale, "fr" when action in [:show]

  plug :cast_parameters when action in [:show]
  plug :authenticate when action in [:show]

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def show(conn, %{"message" => message}) do
    render(conn, "show.html", message: message)
  end

  def show(conn, _params) do
    render(conn, "show.html", message: "not message")
  end

  defp cast_parameters(conn, _) do

    casted_params = conn.params
    |> Map.put(
      "user_id",
      conn.params["user_id"] && String.to_integer(conn.params["user_id"])
    )

    %{conn | params: casted_params}
  end

  # second argument is parameter passed to plug
  defp authenticate(conn, _) do
    params = conn.params

    ( params["user_id"] in @fake_ids &&
      assign(conn, :user_name, "Anderson")
    ) || halt(conn)

   end
end
