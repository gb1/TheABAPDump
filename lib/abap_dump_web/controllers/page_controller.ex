defmodule AbapDumpWeb.PageController do
  use AbapDumpWeb, :controller

  alias AbapDump.TAD
  alias AbapDump.TAD.Pearl

  def index(conn, _params) do
    pearls = TAD.list_pearls

    conn
    |> assign(:pearls, pearls)
    |> render("index.html")
  end

end
