defmodule InkyTest do
  use ExUnit.Case
  doctest Inky

  test "greets the world" do
    assert Inky.hello() == :world
  end
end
