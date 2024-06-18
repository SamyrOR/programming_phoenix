defmodule RumblWeb.AnnotationHTML do
  use RumblWeb, :html

  def render("annotation.json", %{annotation: annotation}) do
    %{
      id: annotation.id,
      body: annotation.body,
      at: annotation.at,
      user: RumblWeb.UserHTML.render("user.json", %{user: annotation.user})
    }
  end
end
