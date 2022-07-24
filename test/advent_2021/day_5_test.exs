defmodule Advent2021.Day5Test do
  use ExUnit.Case

  @test_input """
  0,9 -> 5,9
  8,0 -> 0,8
  9,4 -> 3,4
  2,2 -> 2,1
  7,0 -> 7,4
  6,4 -> 2,0
  0,9 -> 2,9
  3,4 -> 1,4
  0,0 -> 8,8
  5,5 -> 8,2
  """

  test "part 1" do
    assert 5 ==
             @test_input |> Advent2021.Day5.Part1.prepare_input() |> Advent2021.Day5.Part1.run()
  end

  test "part 2" do
    assert 12 ==
             @test_input |> Advent2021.Day5.Part2.prepare_input() |> Advent2021.Day5.Part2.run()
  end
end
