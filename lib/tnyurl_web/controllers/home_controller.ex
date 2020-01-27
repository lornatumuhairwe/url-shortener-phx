defmodule TnyurlWeb.HomeController do
  use TnyurlWeb, :controller

  alias Tnyurl.Urls
  alias Tnyurl.Urls.Url
  alias TnyurlWeb.ErrorView

  def index(conn, params) do
    changeset = Urls.change_url(params)
    links = Urls.list_urls()
    render(conn, "index.html", changeset: changeset, links: links)
  end

  def create(conn, %{"url" => url}) do
    case Urls.create_url(url) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Success!")
        |> redirect(to: "/")
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "index.html", changeset: changeset, links: Urls.list_urls())
    end

  end

  def show(conn, %{"slug" => slug}) do
    url = Urls.get_url(slug)
    case url do
      %Url{} ->
        redirect(conn, external: url.name)
      _ ->
        conn
        |> put_status(:not_found)
        |> put_view(ErrorView)
        |> render(:"404")
    end
  end
end
