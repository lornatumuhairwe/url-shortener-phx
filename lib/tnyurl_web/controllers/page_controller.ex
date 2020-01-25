defmodule TnyurlWeb.PageController do
  use TnyurlWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
