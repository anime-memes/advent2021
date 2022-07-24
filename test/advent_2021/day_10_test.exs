defmodule Advent2021.Day10Test do
  use ExUnit.Case

  @test_input """
  [({(<(())[]>[[{[]{<()<>>
  [(()[<>])]({[<{<<[]>>(
  {([(<{}[<>[]}>{[]{[(<()>
  (((({<>}<{<{<>}{[]{[]{}
  [[<[([]))<([[{}[[()]]]
  [{[{({}]{}}([{[{{{}}([]
  {<[[]]>}<{[{[{[]{()[[[]
  [<(<(<(<{}))><([]([]()
  <{([([[(<>()){}]>(<<{{
  <{([{{}}[<[[[<>{}]]]>[]]
  """

  test "part 1" do
    assert 26397 == Advent2021.Day10.Part1.run(@test_input)
  end

  test "part 2" do
    assert 288_957 == Advent2021.Day10.Part2.run(@test_input)
  end
end
