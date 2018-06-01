defmodule AbapDump.TAD do
  @moduledoc """
  The TAD context.
  """

  import Ecto.Query, warn: false
  alias AbapDump.Repo

  alias AbapDump.TAD.Pearl

  @doc """
  Returns the list of pearls.

  ## Examples

      iex> list_pearls()
      [%Pearl{}, ...]

  """
  def list_pearls do
    Repo.all(Pearl)
  end

  @doc """
  Gets a single pearl.

  Raises `Ecto.NoResultsError` if the Pearl does not exist.

  ## Examples

      iex> get_pearl!(123)
      %Pearl{}

      iex> get_pearl!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pearl!(id), do: Repo.get!(Pearl, id)

  @doc """
  Creates a pearl.

  ## Examples

      iex> create_pearl(%{field: value})
      {:ok, %Pearl{}}

      iex> create_pearl(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pearl(attrs \\ %{}) do
    %Pearl{}
    |> Pearl.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pearl.

  ## Examples

      iex> update_pearl(pearl, %{field: new_value})
      {:ok, %Pearl{}}

      iex> update_pearl(pearl, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pearl(%Pearl{} = pearl, attrs) do
    pearl
    |> Pearl.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Pearl.

  ## Examples

      iex> delete_pearl(pearl)
      {:ok, %Pearl{}}

      iex> delete_pearl(pearl)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pearl(%Pearl{} = pearl) do
    Repo.delete(pearl)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pearl changes.

  ## Examples

      iex> change_pearl(pearl)
      %Ecto.Changeset{source: %Pearl{}}

  """
  def change_pearl(%Pearl{} = pearl) do
    Pearl.changeset(pearl, %{})
  end
end
