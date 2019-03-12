defmodule TinyBlogWeb.Router do
  use TinyBlogWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :auth do
    plug TinyBlog.Auth.Pipeline
  end

  pipeline :ensure_auth do
    plug Guardian.Plug.EnsureAuthenticated
  end

  scope "/admin", TinyBlogWeb do
    pipe_through([:browser, :auth, :ensure_auth])

    resources "/users", UserController, except: [:show, :edit]
    resources "/articles", ArticleController, except: [:index, :show]
  end
  
  scope "/", TinyBlogWeb do
    pipe_through [:browser, :auth]

    get "/", ArticleController, :index
    resources "/articles", ArticleController, only: [:index, :show]

    get "/session/new", SessionController, :new
    post "/session", SessionController, :create
    delete "/session", SessionController, :delete
  end

  # Other scopes may use custom stacks.
  # scope "/api", TinyBlogWeb do
  #   pipe_through :api
  # end
end
