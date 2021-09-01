defmodule TictacTest do
  use ExUnit.Case
  doctest Tictac

  test "greets the world" do
    assert Tictac.hello() == :world
  end
end
