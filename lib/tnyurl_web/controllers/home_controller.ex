defmodule TnyurlWeb.HomeController do
  use TnyurlWeb, :controller

  alias Tnyurl.Urls

  def index(conn, params) do
    changeset = Urls.change_url(params)
    links = Urls.list_urls()
    render(conn, "index.html", changeset: changeset, links: links)
  end

  def create(conn, %{"url" => url}) do
    Urls.create_url(url)
    redirect(conn, to: "/")
  end

  def show(conn, %{"slug" => slug}) do
    url = Urls.get_url(slug)
    redirect(conn, external: url.name)
  end
end
