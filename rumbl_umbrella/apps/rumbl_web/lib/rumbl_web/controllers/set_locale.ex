defmodule RumblWeb.SetLocale do
  import Plug.Conn

  @suppoted_locales Gettext.known_locales(RumblWeb.Gettext)

  def init(opts), do: opts

  def call(conn, _opts) do
    case fetch_locale_from(conn) do
      nil ->
        conn

      locale ->
        RumblWeb.Gettext |> Gettext.put_locale(locale)

        conn
        |> put_resp_cookie("locale", locale, max_age: 365 * 24 * 60 * 60)
        |> assign(:conn, conn)
    end
  end

  defp fetch_locale_from(conn) do
    conn.params["locale"] || conn.cookies["locale"] |> check_locale
  end

  defp check_locale(locale) when locale in @suppoted_locales, do: locale
  defp check_locale(_), do: nil
end
