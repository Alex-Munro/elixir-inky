defmodule Inky do
  @moduledoc """
  Documentation for `Inky`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Inky.hello()
      :world


  {
    button: 'button',
    row: 'row',
    columns: 'columns',
    container: 'container',
    inky: 'inky',
    blockGrid: 'block-grid',
    menu: 'menu',
    menuItem: 'item'
  }
  """
  # parse wrapper elements
  alias Inky.Components

  def parse(string) do
    string
    # |> Path.expand()
    # |> File.read()
    # |> case do
    #  {:ok, content} -> content |> Floki.parse_fragment()
    #  {:error, _} = error -> error
    # end
    # |> elem(1)
    |> Floki.parse_fragment()
    |> elem(1)
    |> first_and_last_columns
    |> swap_inky_to_html
    |> Floki.raw_html()
  end

  defp first_and_last_columns(doc) do
    doc
    |> Floki.find_and_update("column", fn
      {"column", attributes} ->
        {"columns", attributes}
    end) 
    |> Floki.find_and_update("columns:first-of-type", fn
      {"columns", attributes} ->
        {"columns", attributes ++ [{"position", "first"}]}
    end)
    |> Floki.find_and_update("columns:last-of-type", fn
      {"columns", attributes} ->
        {"columns", attributes ++ [{"position", "last"}]}
    end)
  end

  defp swap_inky_to_html(doc) do
    doc 
    |> Floki.traverse_and_update(fn x -> Components.parse(x) end)
  end

end
