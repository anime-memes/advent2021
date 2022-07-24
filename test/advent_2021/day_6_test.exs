defmodule Advent2021.Day6Test do
  use ExUnit.Case

  @test_input [3, 4, 3, 1, 2]

  test "part 1" do
    assert 5934 == Advent2021.Day6.Part1.run(@test_input)
  end

  test "part 2" do
    assert 26_984_457_539 == Advent2021.Day6.Part2.run(@test_input)
    assert 26_984_457_539 == Advent2021.Day6.Part2Nx.run(@test_input)
  end
end
