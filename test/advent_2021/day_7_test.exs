defmodule Advent2021.Day7Test do
  use ExUnit.Case

  @test_input [16, 1, 2, 0, 4, 2, 7, 1, 2, 14]

  test "part 1" do
    assert 37 == Advent2021.Day7.Part1.run(@test_input)
  end

  test "part 2" do
    assert 168 == Advent2021.Day7.Part2.run(@test_input)
  end
end
