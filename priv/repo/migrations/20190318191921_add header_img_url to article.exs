defmodule :"Elixir.TinyBlog.Repo.Migrations.Add headerImgUrl to article" do
  use Ecto.Migration

  def change do
    alter table(:articles) do
      add :header_img_url, :string
    end
  end
end