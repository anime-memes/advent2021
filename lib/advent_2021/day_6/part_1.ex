defmodule Advent2021.Day6.Part1 do
  @epochs 80

  def run do
    "./priv/day_6_input"
    |> File.read!()
    |> String.trim()
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
    |> run()
  end

  def run(state) do
    Enum.reduce(0..(@epochs - 1), state, fn _, state -> simulate_epoch(state) end) |> length()
  end

  defp simulate_epoch(state) do
    simulate_epoch(state, [])
  end

  defp simulate_epoch([0 | tail], children) do
    [6 | simulate_epoch(tail, [8 | children])]
  end

  defp simulate_epoch([head | tail], children) do
    [head - 1 | simulate_epoch(tail, children)]
  end

  defp simulate_epoch([], children), do: children
end
