defmodule TnyurlWeb.HomeControllerTest do
  use TnyurlWeb.ConnCase
  alias Tnyurl.Urls

  @valid_attributes %{name: "http://youtube.com"}

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Shorten your url"
  end

  test "POST /shorten", %{conn: conn} do
    conn = post(conn, "/shorten", url: @valid_attributes)
    assert html_response(conn, 302)
  end

  test "POST /shorten without a name", %{conn: conn} do
    conn = post(conn, "/shorten", url: %{name: ""})
    assert html_response(conn, 200) =~ "can&#39;t be blank"
  end

  test "POST /shorten with a name that is not a url", %{conn: conn} do
    conn = post(conn, "/shorten", url: %{name: "url that is not a url"})
    assert html_response(conn, 200) =~ "has invalid format"
  end

  test "GET /:slug without an existing slug returns 404", %{conn: conn} do
    conn = get(conn, "/non-existing-slug")
    assert html_response(conn, 404)
  end

  test "GET /:slug with an existing slug redirects", %{conn: conn} do
    {:ok, url} = Urls.create_url(@valid_attributes)
    conn = get(conn, "/" <> url.slug)
    assert html_response(conn, 302)
  end
end
