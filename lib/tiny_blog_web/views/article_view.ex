defmodule TinyBlogWeb.ArticleView do
  use TinyBlogWeb, :view

  def is_logged_in(conn, _params) do
    Guardian.Plug.current_resource(conn) !== nil 
  end  

  def prev_page_link(conn, params) do
    link_to_page(conn, params.prev_page)
  end
  
  def next_page_link(conn, params) do
    link_to_page(conn, params.next_page)
  end

  def first_page_link(conn, _params) do
    link_to_page(conn, 1)
  end

  def last_page_link(conn, params) do
    link_to_page(conn, params.last_page)
  end

  defp link_to_page(conn, page_num) do
    Routes.article_path(conn, :index, %{ "page" => page_num })
  end
end
