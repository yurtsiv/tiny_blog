defmodule TinyBlogWeb.SessionController do
  use TinyBlogWeb, :controller

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, params) do
    %{
      "email" => email,
      "password" => password
    } = params

    case TinyBlog.Auth.authenticate_user(email, password) do
      {:ok, user} ->
        conn
        |> TinyBlog.Auth.login(user)
        |> put_flash(:info, "You're logged in")
        |> redirect(to: Routes.article_path(conn, :index))

      {:error, reason} ->
        conn
        |> put_flash(:error, reason)
        |> render("new.html")
    end
  end
end
