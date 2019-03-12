defmodule TinyBlog.Auth.Pipeline do
  @moduledoc false

  use Guardian.Plug.Pipeline, otp_app: :tiny_blog

  plug Guardian.Plug.VerifySession, claims: %{"typ" => "access"}
  plug Guardian.Plug.LoadResource, allow_blank: true
end