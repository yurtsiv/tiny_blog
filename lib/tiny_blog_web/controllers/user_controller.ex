defmodule TinyBlogWeb.UserController do
  use TinyBlogWeb, :controller

  alias TinyBlog.Accounts
  alias TinyBlog.Accounts.User


  def index(conn, _params) do
    users = Accounts.list_users()
    current_user = Guardian.Plug.current_resource(conn)
    render(conn, "index.html", users: users, current_user: current_user)
  end

  def new(conn, _params) do
    changeset = Accounts.change_user(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params} = params) do
    case Accounts.create_user(user_params) do
      {:ok, _user} ->
        conn
        |> put_flash(:info, "User created successfully.")
        |> index(params)

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id} = params) do
    %{:id => current_user_id} = Guardian.Plug.current_resource(conn)
    {user_to_delete_id, _} = Integer.parse id
    case current_user_id == user_to_delete_id do
      true ->
        conn
        |> put_flash(:error, "You can't delete yourself")
        |> index(params)
      false ->
        user = Accounts.get_user!(id)
        {:ok, _user} = Accounts.delete_user(user)
        conn
        |> put_flash(:info, "User deleted successfully.")
        |> redirect(to: Routes.user_path(conn, :index))
    end
  end
end
