defmodule AbapDumpWeb.PearlControllerTest do
  use AbapDumpWeb.ConnCase

  alias AbapDump.TAD

  @create_attrs %{
    author_id: 42,
    code: "some code",
    description: "some description",
    title: "some title"
  }
  @update_attrs %{
    author_id: 43,
    code: "some updated code",
    description: "some updated description",
    title: "some updated title"
  }
  @invalid_attrs %{author_id: nil, code: nil, description: nil, title: nil}

  def fixture(:pearl) do
    {:ok, pearl} = TAD.create_pearl(@create_attrs)
    pearl
  end

  describe "index" do
    test "lists all pearls", %{conn: conn} do
      conn = get(conn, pearl_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Pearls"
    end
  end

  describe "new pearl" do
    test "renders form", %{conn: conn} do
      conn = get(conn, pearl_path(conn, :new))
      assert html_response(conn, 200) =~ "New Pearl"
    end
  end

  describe "create pearl" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, pearl_path(conn, :create), pearl: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == pearl_path(conn, :show, id)

      conn = get(conn, pearl_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Description"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, pearl_path(conn, :create), pearl: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Pearl"
    end
  end

  describe "edit pearl" do
    setup [:create_pearl]

    test "renders form for editing chosen pearl", %{conn: conn, pearl: pearl} do
      conn = get(conn, pearl_path(conn, :edit, pearl))
      assert html_response(conn, 200) =~ "Edit Pearl"
    end
  end

  describe "update pearl" do
    setup [:create_pearl]

    test "redirects when data is valid", %{conn: conn, pearl: pearl} do
      conn = put(conn, pearl_path(conn, :update, pearl), pearl: @update_attrs)
      assert redirected_to(conn) == pearl_path(conn, :show, pearl)

      conn = get(conn, pearl_path(conn, :show, pearl))
      assert html_response(conn, 200) =~ "some updated code"
    end

    test "renders errors when data is invalid", %{conn: conn, pearl: pearl} do
      conn = put(conn, pearl_path(conn, :update, pearl), pearl: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Pearl"
    end
  end

  describe "delete pearl" do
    setup [:create_pearl]

    test "deletes chosen pearl", %{conn: conn, pearl: pearl} do
      conn = delete(conn, pearl_path(conn, :delete, pearl))
      assert redirected_to(conn) == pearl_path(conn, :index)

      assert_error_sent(404, fn ->
        get(conn, pearl_path(conn, :show, pearl))
      end)
    end
  end

  defp create_pearl(_) do
    pearl = fixture(:pearl)
    {:ok, pearl: pearl}
  end
end
