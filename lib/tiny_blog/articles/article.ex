defmodule TinyBlog.Articles.Article do
  use Ecto.Schema
  import Ecto.Changeset


  schema "articles" do
    field :body, :string
    field :createdAt, :date
    field :title, :string
    field :updatedAt, :date
    field :author, :id

    timestamps()
  end

  @doc false
  def changeset(article, attrs) do
    article
    |> cast(attrs, [:title, :body, :createdAt, :updatedAt])
    |> validate_required([:title, :body, :createdAt, :updatedAt])
  end
end
