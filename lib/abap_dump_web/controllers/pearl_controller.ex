defmodule AbapDumpWeb.PearlController do
  use AbapDumpWeb, :controller
  require IEx

  alias AbapDump.TAD
  alias AbapDump.TAD.Pearl

  require IEx

  def index(conn, _params) do
    pearls = TAD.list_pearls()
    render(conn, "index.html", pearls: pearls)
  end

  def new(conn, _params) do
    changeset = TAD.change_pearl(%Pearl{})
    if conn.assigns[:user] do
      render(conn, "new.html", changeset: changeset)
    else
      conn
      |> put_flash(:info, "Login to post")
      |> redirect(to: "/")
    end
  end

  def create(conn, %{"pearl" => pearl_params}) do

    pearl_params |> Map.put_new("name", conn.assigns[:user].name)

    case TAD.create_pearl(pearl_params) do
      {:ok, pearl} ->
        conn
        |> put_flash(:info, "Pearl created successfully.")
        |> redirect(to: pearl_path(conn, :show, pearl))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    pearl = TAD.get_pearl!(id)
    render(conn, "show.html", pearl: pearl)
  end

  def edit(conn, %{"id" => id}) do
    pearl = TAD.get_pearl!(id)
    changeset = TAD.change_pearl(pearl)
    render(conn, "edit.html", pearl: pearl, changeset: changeset)
  end

  def update(conn, %{"id" => id, "pearl" => pearl_params}) do
    pearl = TAD.get_pearl!(id)

    case TAD.update_pearl(pearl, pearl_params) do
      {:ok, pearl} ->
        conn
        |> put_flash(:info, "Pearl updated successfully.")
        |> redirect(to: pearl_path(conn, :show, pearl))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", pearl: pearl, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    pearl = TAD.get_pearl!(id)
    {:ok, _pearl} = TAD.delete_pearl(pearl)

    conn
    |> put_flash(:info, "Pearl deleted successfully.")
    |> redirect(to: pearl_path(conn, :index))
  end
end
