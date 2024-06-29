defmodule LiveViewWeb.WelcomeLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~H"""
    <div>
      <h2><%= @salutation %></h2>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    salutation = "Welcome to LiveView, from the Programming Phoenix team!"
    {:ok, assign(socket, salutation: salutation)}
  end
end
