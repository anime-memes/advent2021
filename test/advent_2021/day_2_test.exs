defmodule Advent2021.Day2Test do
  use ExUnit.Case

  @test_input [
    {"forward", 5},
    {"down", 5},
    {"forward", 8},
    {"up", 3},
    {"down", 8},
    {"forward", 2}
  ]

  test "part 1" do
    assert 150 == Advent2021.Day2.Part1.run(@test_input)
  end

  test "part 2" do
    assert 900 == Advent2021.Day2.Part2.run(@test_input)
  end
end
