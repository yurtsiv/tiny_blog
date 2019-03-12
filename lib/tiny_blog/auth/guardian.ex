defmodule TinyBlog.Auth.Guardian do
  @moduledoc false

  use Guardian, otp_app: :tiny_blog

  alias TinyBlog.Accounts

  def subject_for_token(user, _claims) do
    sub = to_string(user.id)
    {:ok, sub}
  end

  def resource_from_claims(claims) do
    id = claims["sub"]
    user = Accounts.get_user!(id)
    {:ok, user}
  end
end
