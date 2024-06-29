defmodule LiveViewWeb.CounterLive do
  use LiveViewWeb, :live_view

  def render(assigns) do
    ~H"""
    <div>
      <h1>The count is: <%= @val %></h1>
      <.button phx-click="boom">BOOM</.button>
      <.button phx-click="dec">-</.button>
      <.button phx-click="inc">+</.button>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :val, 0)}
  end

  def handle_event("inc", _, socket) do
    {:noreply, update(socket, :val, &(&1 + 1))}
  end

  def handle_event("dec", _, socket) do
    {:noreply, update(socket, :val, &(&1 - 1))}
  end
end
