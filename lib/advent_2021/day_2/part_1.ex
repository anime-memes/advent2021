defmodule Advent2021.Day2.Part1 do
  def run do
    "./priv/day_2_input"
    |> File.read!()
    |> String.split("\n", trim: true)
    |> Enum.map(&String.split(&1, " ", trim: true))
    |> Enum.map(fn [direction, units] -> {direction, String.to_integer(units)} end)
    |> run()
  end

  def run(input), do: run(input, {0, 0})

  def run([], {x, y}), do: x * y

  def run([{"forward", units} | tail], {x, y}), do: run(tail, {x + units, y})
  def run([{"up", units} | tail], {x, y}), do: run(tail, {x, y - units})
  def run([{"down", units} | tail], {x, y}), do: run(tail, {x, y + units})
end
