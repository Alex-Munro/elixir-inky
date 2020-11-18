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
    |> Floki.traverse_and_update(fn x -> Components.parse(x) end)
    |> Floki.raw_html()
  end
end
