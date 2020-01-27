defmodule TnyurlWeb.HomeControllerTest do
  use TnyurlWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Shorten your url"
  end

  test "POST /shorten", %{conn: conn} do
    conn = post(conn, "/shorten", url: %{name: "http://youtube.com"})
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
end
