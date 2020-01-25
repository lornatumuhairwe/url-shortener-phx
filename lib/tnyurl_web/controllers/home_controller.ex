defmodule TnyurlWeb.HomeController do
  use TnyurlWeb, :controller

  alias Tnyurl.Urls

  def index(conn, params) do
    changeset = Urls.change_url(params)
    links = Urls.list_urls()
    render(conn, "index.html", changeset: changeset, links: links)
  end

  def create(conn, %{"url" => url}) do
    case Urls.create_url(url) do
      {:ok, url} ->
        conn
        |> put_flash(:info, "Success!")
        |> redirect(to: "/")
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "index.html", changeset: changeset, links: Urls.list_urls())
    end

  end

  def show(conn, %{"slug" => slug}) do
    url = Urls.get_url(slug)
    redirect(conn, external: url.name)
  end
end
