defmodule TinyBlog.Repo.Migrations.UpdateArticlesTable do
  use Ecto.Migration

  def change do
    alter table(:articles) do
      remove :createdAt
      remove :updatedAt
    end
  end
end
