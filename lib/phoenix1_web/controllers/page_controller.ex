defmodule Phoenix1Web.PageController do
  use Phoenix1Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
