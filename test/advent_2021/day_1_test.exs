defmodule Advent2021.Day1Test do
  use ExUnit.Case

  @test_input [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]

  test "part 1" do
    assert 7 == Advent2021.Day1.Part1.run(@test_input)
  end

  test "part 2" do
    assert 5 == Advent2021.Day1.Part2.run(@test_input)
  end
end
