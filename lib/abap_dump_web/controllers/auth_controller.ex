defmodule AbapDumpWeb.AuthController do
  use AbapDumpWeb, :controller
  plug(Ueberauth)

  require IEx

  alias AbapDump.User
  alias AbapDump.Repo

  def new(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    user_params =
      %{
        token: auth.credentials.token,
        name: auth.info.first_name <> auth.info.last_name,
        email: auth.info.email,
        provider: "google"
      }

    changeset = User.changeset(%User{}, user_params)

    # IEx.pry

    create(conn, changeset)
  end

  def create(conn, changeset) do
    case insert_or_update_user(changeset) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Thank you for signing in!")
        |> put_session(:user_id, user.id)
        |> redirect(to: page_path(conn, :index))

      {:error, _reason} ->
        conn
        |> put_flash(:error, "Error signing in")
        |> redirect(to: page_path(conn, :index))
    end
  end

  defp insert_or_update_user(changeset) do
    case Repo.get_by(User, email: changeset.changes.email) do
      nil ->
        Repo.insert(changeset)

      user ->
        {:ok, user}
    end
  end

  def delete(conn, _params) do
    conn
    |> configure_session(drop: true)
    |> redirect(to: page_path(conn, :index))
  end
end
