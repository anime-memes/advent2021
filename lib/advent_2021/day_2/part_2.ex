defmodule Advent2021.Day2.Part2 do
  def run do
    "./priv/day_2_input"
    |> File.read!()
    |> String.split("\n", trim: true)
    |> Enum.map(&String.split(&1, " ", trim: true))
    |> Enum.map(fn [direction, units] -> {direction, String.to_integer(units)} end)
    |> run()
  end

  def run(input), do: run(input, {0, 0, 0})

  def run([], {x, y, _}), do: x * y

  def run([{"forward", units} | tail], {x, y, z}), do: run(tail, {x + units, y + units * z, z})
  def run([{"up", units} | tail], {x, y, z}), do: run(tail, {x, y, z - units})
  def run([{"down", units} | tail], {x, y, z}), do: run(tail, {x, y, z + units})
end
