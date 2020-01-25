defmodule TnyurlWeb.Router do
  use TnyurlWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TnyurlWeb do
    pipe_through :browser

    get "/", HomeController, :index
    get "/:slug", HomeController, :show
    post "/shorten", HomeController, :create
  end
end
