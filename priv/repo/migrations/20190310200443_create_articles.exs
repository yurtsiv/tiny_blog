defmodule TinyBlog.Repo.Migrations.CreateArticles do
  use Ecto.Migration

  def change do
    create table(:articles) do
      add :title, :string
      add :body, :string
      add :createdAt, :date
      add :updatedAt, :date
      add :author, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:articles, [:author])
  end
end
