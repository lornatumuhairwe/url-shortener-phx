defmodule Tnyurl.UrlsTest do
  use Tnyurl.DataCase

  alias Tnyurl.Urls

  describe "urls" do
    alias Tnyurl.Urls.Url

    @valid_attrs %{name: "https://mysterious-meadow-6277.herokuapp.com/"}
    @invalid_attrs %{name: "test that is not a url"}
    @another_invalid_attrs %{}

    test "create_url/1 with valid data creates a new url with slug" do
      assert {:ok, %Url{} = url} = Urls.create_url(@valid_attrs)
      assert url.name == "https://mysterious-meadow-6277.herokuapp.com/"
      assert url.slug
    end

    test "throws error when url name is not provided" do
       changeset = Url.changeset(%Url{}, @another_invalid_attrs)
       refute changeset.valid?
       assert %{name: ["can't be blank"]} = errors_on(changeset)
    end

    test "is invalid when the url name is not a valid url" do
      changeset = Url.changeset(%Url{}, @invalid_attrs)
      refute changeset.valid?
      assert %{name: ["has invalid format"]}
    end
  end
end
