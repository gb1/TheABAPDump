defmodule AbapDumpWeb.PostController do
  use AbapDumpWeb, :controller

  alias AbapDump.TAD
  alias AbapDump.TAD.Pearl


  def index(conn, _params) do
    changeset = TAD.change_pearl(%Pearl{})

    conn
    |> assign(:action, pearl_path(conn, :create))
    |> render("index.html", changeset: changeset)
  end

end
