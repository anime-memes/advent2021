defmodule Advent2021.Day1.Part2 do
  def run do
    "./priv/day_1_input"
    |> File.read!()
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> run()
  end

  def run(input) do
    input
    |> Enum.chunk_every(3, 1, :discard)
    |> Enum.map(&Enum.sum/1)
    |> Advent2021.Day1.Part1.run()
  end
end
