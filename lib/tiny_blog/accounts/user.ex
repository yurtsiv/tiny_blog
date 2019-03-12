defmodule TinyBlog.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias TinyBlog.Articles.Article

  schema "users" do
    field :name, :string
    field :email, :string
    field :encrypted_password, :string
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :encrypted_password])
    |> validate_required([:name, :email, :encrypted_password])
    |> unique_constraint(:name)
    |> unique_constraint(:email)
  end

  @doc false
  def registration_changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :encrypted_password])
    |> validate_required([:name, :email, :encrypted_password])
    |> validate_length(:name, min: 3, max: 10)
    |> validate_length(:encrypted_password, min: 3, max: 10)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:name)
    |> unique_constraint(:email)
    |> put_password_hash()
  end

  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{encrypted_password: pass}} ->
        put_change(changeset, :encrypted_password, Comeonin.Bcrypt.hashpwsalt(pass))

      _ ->
        changeset
    end
  end
end
