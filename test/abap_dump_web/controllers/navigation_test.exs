defmodule AbapDumpWeb.NavigationTest do
  use AbapDumpWeb.ConnCase, async: true
  import AbapDump.Factory

  test "shows a sign out link when signed in", %{conn: conn} do
    user = insert(:user)

    conn =
      conn
      |> assign(:user, user)
      |> get("/")

    assert html_response(conn, 200) =~ "Sign out"
  end
end
