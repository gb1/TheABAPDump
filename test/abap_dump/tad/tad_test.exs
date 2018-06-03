defmodule AbapDump.TADTest do
  use AbapDump.DataCase

  alias AbapDump.TAD

  describe "pearls" do
    alias AbapDump.TAD.Pearl

    @valid_attrs %{
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

    def pearl_fixture(attrs \\ %{}) do
      {:ok, pearl} =
        attrs
        |> Enum.into(@valid_attrs)
        |> TAD.create_pearl()

      pearl
    end

    test "list_pearls/0 returns all pearls" do
      pearl = pearl_fixture()
      assert TAD.list_pearls() == [pearl]
    end

    test "get_pearl!/1 returns the pearl with given id" do
      pearl = pearl_fixture()
      assert TAD.get_pearl!(pearl.id) == pearl
    end

    test "create_pearl/1 with valid data creates a pearl" do
      assert {:ok, %Pearl{} = pearl} = TAD.create_pearl(@valid_attrs)
      assert pearl.author_id == 42
      assert pearl.code == "some code"
      assert pearl.description == "some description"
      assert pearl.title == "some title"
    end

    test "create_pearl/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TAD.create_pearl(@invalid_attrs)
    end

    test "update_pearl/2 with valid data updates the pearl" do
      pearl = pearl_fixture()
      assert {:ok, pearl} = TAD.update_pearl(pearl, @update_attrs)
      assert %Pearl{} = pearl
      assert pearl.author_id == 43
      assert pearl.code == "some updated code"
      assert pearl.description == "some updated description"
      assert pearl.title == "some updated title"
    end

    test "update_pearl/2 with invalid data returns error changeset" do
      pearl = pearl_fixture()
      assert {:error, %Ecto.Changeset{}} = TAD.update_pearl(pearl, @invalid_attrs)
      assert pearl == TAD.get_pearl!(pearl.id)
    end

    test "delete_pearl/1 deletes the pearl" do
      pearl = pearl_fixture()
      assert {:ok, %Pearl{}} = TAD.delete_pearl(pearl)
      assert_raise Ecto.NoResultsError, fn -> TAD.get_pearl!(pearl.id) end
    end

    test "change_pearl/1 returns a pearl changeset" do
      pearl = pearl_fixture()
      assert %Ecto.Changeset{} = TAD.change_pearl(pearl)
    end
  end
end
