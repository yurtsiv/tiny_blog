defmodule :"Elixir.TinyBlog.Repo.Migrations.Fix headerImgUrl size" do
  use Ecto.Migration

  def change do
    alter table(:articles) do
      modify :header_img_url, :text
    end
  end
end
