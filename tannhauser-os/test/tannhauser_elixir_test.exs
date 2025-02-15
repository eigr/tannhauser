defmodule TannhauserOSTest do
  use ExUnit.Case
  doctest TannhauserOS

  test "greets the world" do
    assert TannhauserOS.hello() == :world
  end
end
