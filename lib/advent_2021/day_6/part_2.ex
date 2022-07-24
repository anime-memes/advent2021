defmodule Advent2021.Day6.Part2 do
  @epochs 256

  def run do
    "./priv/day_6_input"
    |> File.read!()
    |> String.trim()
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
    |> run()
  end

  def run(state) do
    frequencies = Enum.frequencies(state)

    amounts =
      0..8
      |> Enum.map(fn i -> frequencies[i] || 0 end)
      |> List.to_tuple()

    Enum.reduce(0..(@epochs - 1), amounts, fn _, state -> simulate_epoch(state) end)
    |> Tuple.sum()
  end

  defp simulate_epoch({day0, day1, day2, day3, day4, day5, day6, day7, day8}) do
    {day1, day2, day3, day4, day5, day6, day7 + day0, day8, day0}
  end
end
