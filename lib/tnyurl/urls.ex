defmodule Tnyurl.Urls do
  import Ecto.Query, warn: false
  alias Tnyurl.Repo
  alias Tnyurl.Urls.Url

  def create_url(attrs \\ %{}) do
    %Url{}
    |> Url.changeset(attrs)
    |> Repo.insert()
  end

  def change_url(attrs \\ %{}) do
    Url.changeset(%Url{}, attrs)
  end

  def list_urls do
    Repo.all(Url |> order_by(desc: :inserted_at))
  end

  def get_url(slug) do
    Repo.get_by(Url, slug: slug)
  end
end
