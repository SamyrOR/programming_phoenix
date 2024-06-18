defmodule RumblWeb.ErrorHTMLTest do
  use RumblWeb.ConnCase, async: true

  # Bring render_to_string/4 for testing custom views
  import Phoenix.Template

  test "renders 404.html" do
    assert render_to_string(RumblWeb.ErrorHTML, "404", "html", []) == "<p>Not found</p>"
  end

  test "renders 500.html" do
    assert render_to_string(RumblWeb.ErrorHTML, "500", "html", []) ==
             "<p>\n  \"Internal server error\"\n</p>"
  end
end
