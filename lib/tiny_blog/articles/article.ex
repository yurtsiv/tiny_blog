defmodule TinyBlog.Articles.Article do
  use Ecto.Schema
  import Ecto.Changeset


  schema "articles" do
    field :body, :string
    field :title, :string
    has_one :author, User

    timestamps()
  end

  @doc false
  def changeset(article, attrs) do
    article
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body]) 
  end
end