defmodule :"Elixir.TinyBlog.Repo.Migrations.Fix article body str length" do
  use Ecto.Migration

  def change do
    alter table(:articles) do
      modify :body, :text
    end
  end
end
