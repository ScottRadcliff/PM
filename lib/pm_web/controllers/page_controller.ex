defmodule PmWeb.PageController do
  use PmWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
