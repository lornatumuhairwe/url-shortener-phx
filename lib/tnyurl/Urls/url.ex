defmodule Tnyurl.Urls.Url do
  use Ecto.Schema
  import Ecto.Changeset

  schema "urls" do
    field :name, :string
    field :slug, :string

    timestamps()
  end

  @doc false
  def changeset(url, attrs) do
    url
    |> cast(attrs, [:name])
    |> put_change(:slug, generate_slug())
    |> validate_required([:name, :slug])
  end

  def generate_slug() do
    :crypto.strong_rand_bytes(12)
    |> Base.url_encode64(padding: false)
  end
end
