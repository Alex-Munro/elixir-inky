defmodule InkyTest do
  use ExUnit.Case
  doctest Inky

  @tag :skip
  test "greets the world" do
    assert Inky.hello() == :world
  end



end
