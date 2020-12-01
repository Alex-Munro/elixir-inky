defmodule Inky do
  @moduledoc """
  Documentation for `Inky`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Inky.hello()
      :wo
  """
  # parse wrapper elements
  alias Inky.Components

  def parse(string) do
    string
    |> parse_to_html
  end

  def parse_to_html(string) do
    string
    |> Floki.parse_fragment()
    |> elem(1)
    |> first_and_last_columns
    |> parse_inky_to_html
    |> Floki.raw_html()
  end

  def parse_to_map(string) do
    string
    |> Floki.parse_fragment()
    |> elem(1)
    |> first_and_last_columns
    |> parse_inky_to_html
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

  defp parse_inky_to_html(doc) do
    doc 
    |> Floki.traverse_and_update(fn x -> Components.parse(x) end)
  end

end
