defmodule TinyBlog.Articles.Article do
  use Ecto.Schema
  import Ecto.Changeset

  schema "articles" do
    field :body, :string
    field :title, :string
    field :header_img_url, :string

    timestamps()
  end

  @doc false
  def changeset(article, attrs) do
    article
    |> cast(attrs, [:title, :body, :header_img_url])
    |> validate_required([:title, :body])
  end
end
