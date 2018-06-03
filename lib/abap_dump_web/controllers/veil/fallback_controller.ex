defmodule AbapDumpWeb.Veil.FallbackController do
  @moduledoc """
  Translates controller action results into valid `Plug.Conn` responses.

  See `Phoenix.Controller.action_fallback/1` for more details.
  """
  require Logger
  use AbapDumpWeb, :controller
  alias AbapDump.Veil.User

  def call(conn, {:error, {:closed, ""}}) do
    Logger.error(fn -> "[Veil] Invalid Swoosh api key, update your config.exs" end)

    render(conn, AbapDumpWeb.Veil.UserView, "new.html", changeset: User.changeset(%User{}))
  end

  def call(conn, {:error, :no_permission}) do
    Logger.error(fn -> "[Veil] Invalid Request or Session" end)

    render(conn, AbapDumpWeb.Veil.UserView, "new.html", changeset: User.changeset(%User{}))
  end
end
