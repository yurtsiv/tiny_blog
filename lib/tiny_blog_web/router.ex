defmodule TinyBlogWeb.Router do
  use TinyBlogWeb, :router

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

  scope "/", TinyBlogWeb do
    pipe_through :browser

    get "/", ArticleController, :index
    resources "/users", UserController, except: [:show]
    resources "/articles", ArticleController
    resources "/session", SessionController, only: [:new, :create]
  end

  # Other scopes may use custom stacks.
  # scope "/api", TinyBlogWeb do
  #   pipe_through :api
  # end
end
