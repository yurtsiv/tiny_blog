defmodule TinyBlogWeb.PageController do
  use TinyBlogWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
