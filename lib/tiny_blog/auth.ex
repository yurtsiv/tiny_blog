defmodule TinyBlog.Auth do
  import Plug.Conn
  require Ecto.Query
  alias TinyBlog.Repo
  alias TinyBlog.Accounts.User

  def authenticate_user(email, given_password) do
    query = Ecto.Query.from(u in User, where: u.email == ^email)

    Repo.one(query)
    |> check_password(given_password)
  end

  defp check_password(nil, _), do: {:error, "Incorrect username or password"}

  defp check_password(user, given_password) do
    case Comeonin.Bcrypt.checkpw(given_password, user.encrypted_password) do
      true -> {:ok, user}
      false -> {:error, "Incorrect username or password"}
    end
  end

  def login(conn, user) do
    conn
    |> TinyBlog.Auth.Guardian.Plug.sign_in(user)
    |> assign(:current_user, user)
  end

  def logout(conn) do
	  TinyBlog.Auth.Guardian.Plug.sign_out(conn)
  end
end
