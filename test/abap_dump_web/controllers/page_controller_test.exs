defmodule AbapDumpWeb.PageControllerTest do
  use AbapDumpWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "WELCOME TO THE ABAP DUMP"
  end
end
