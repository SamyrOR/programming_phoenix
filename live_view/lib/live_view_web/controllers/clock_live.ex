defmodule LiveViewWeb.ClockLive do
  use LiveViewWeb, :live_view

  import Calendar.Strftime

  def render(assigns) do
    ~H"""
    <div>
      <h2>It's <%= strftime!(@date, "%r") %></h2>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    if connected?(socket), do: :timer.send_interval(1000, self(), :tick)
    {:ok, put_date(socket)}
  end

  defp put_date(socket) do
    assign(socket, date: :calendar.local_time())
  end

  def handle_info(:tick, socket) do
    {:noreply, put_date(socket)}
  end
end
