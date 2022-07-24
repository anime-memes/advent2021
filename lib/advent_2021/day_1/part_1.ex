defmodule Advent2021.Day1.Part1 do
  def run do
    "./priv/day_1_input"
    |> File.read!()
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> run()
  end

  def run(input), do: run(input, 0)

  def run([], count), do: count

  def run([first, second | tail], count) when second > first do
    run([second | tail], count + 1)
  end

  def run([_ | tail], count), do: run(tail, count)
end
