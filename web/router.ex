defmodule PortfolioPhoenix.Router do
  use PortfolioPhoenix.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug :fetch_session
    plug :fetch_flash
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.EnsureAuthenticated,
      handler: PortfolioPhoenix.SessionController
  end

  pipeline :browser_auth do
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
    plug PortfolioPhoenix.CurrentUser
  end

  scope "/", PortfolioPhoenix do
    pipe_through [:browser, :browser_auth]

    get "/", PageController, :index
    resources "/sessions", SessionController, only: [:new, :create, :delete]
    resources "/posts", PostController
  end

  scope "/api", PortfolioPhoenix do
    pipe_through :api

    post "/image/upload", PostController, :create_photo
    delete "/image/remove", PostController, :remove_file
  end
end
