defmodule Advent2021.Day3Test do
  use ExUnit.Case

  @test_input """
  00100
  11110
  10110
  10111
  10101
  01111
  00111
  11100
  10000
  11001
  00010
  01010
  """

  test "part 1" do
    assert 198 ==
             @test_input
             |> String.split("\n", trim: true)
             |> Enum.map(&(&1 |> String.to_charlist() |> List.to_tuple()))
             |> Advent2021.Day3.Part1.run()
  end

  test "part 2" do
    assert 230 ==
             @test_input
             |> String.split("\n", trim: true)
             |> Enum.map(&(&1 |> String.to_charlist() |> List.to_tuple()))
             |> Advent2021.Day3.Part2.run()
  end
end
