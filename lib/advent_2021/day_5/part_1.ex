defmodule Advent2021.Day5.Part1 do
  def run do
    "./priv/day_5_input"
    |> File.read!()
    |> prepare_input()
    |> run()
  end

  def prepare_input(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn record ->
      [[x1, y1], [x2, y2]] =
        record |> String.split(" -> ") |> Enum.map(&String.split(&1, ",")) |> Enum.sort()

      {{String.to_integer(x1), String.to_integer(y1)},
       {String.to_integer(x2), String.to_integer(y2)}}
    end)
    |> Enum.filter(fn {{x1, y1}, {x2, y2}} -> x1 == x2 or y1 == y2 end)
  end

  def run(input) do
    input
    |> Enum.map(fn
      {{x, y1}, {x, y2}} ->
        for i <- Range.new(y1, y2) do
          {x, i}
        end

      {{x1, y}, {x2, y}} ->
        for i <- Range.new(x1, x2) do
          {i, y}
        end
    end)
    |> List.flatten()
    |> Enum.reduce(%{}, fn elem, acc ->
      old_value = Map.get(acc, elem, 0)
      Map.put(acc, elem, old_value + 1)
    end)
    |> Enum.filter(fn {_, count} -> count > 1 end)
    |> length()
  end
end
