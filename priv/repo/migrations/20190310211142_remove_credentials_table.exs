defmodule TinyBlog.Repo.Migrations.RemoveCredentialsTable do
  use Ecto.Migration

  def change do
    drop table(:credentials)

    alter table(:users) do
      remove :username
      add :email, :string
      add :encrypted_password, :string
    end
  end
end
