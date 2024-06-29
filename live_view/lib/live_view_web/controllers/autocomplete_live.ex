defmodule LiveViewWeb.AutocompleteLive do
  use LiveViewWeb, :live_view

  def render(assigns) do
    ~H"""
    <form phx-change="suggest" phx-submit="search">
      <input
        type="text"
        name="q"
        value={@query}
        list="matches"
        placeholder="Search..."
        #{if
        @loading,
        do:
        readonly}
      />
      <datalist id="matches">
        <%= for match <- @matches do %>
          <option value={match}>{match}</option>
        <% end %>
      </datalist>
      <%= if @result do %>
        <pre>#{@result}</pre>
      <% end %>
    </form>
    """
  end
end
