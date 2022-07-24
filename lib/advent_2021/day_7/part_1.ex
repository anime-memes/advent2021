defmodule Advent2021.Day7.Part1 do
  def run do
    "./priv/day_7_input"
    |> File.read!()
    |> String.trim()
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
    |> run()
  end

  def run(input) do
    # input = [16, 1, 2, 0, 4, 2, 7, 1, 2, 14]

    max_position = Enum.max(input)

    {_position, fuel} =
      input
      |> Enum.reduce(%{}, fn elem, acc ->
        add_fuel(max_position, elem, acc)
      end)
      |> Enum.sort_by(fn {_key, value} -> value end)
      |> List.first()

    fuel
  end

  defp add_fuel(0, _position, fuel_map), do: fuel_map

  defp add_fuel(new_position, curr_position, fuel_map) do
    curr_fuel = Map.get(fuel_map, new_position, 0)
    new_fuel_map = Map.put(fuel_map, new_position, curr_fuel + abs(new_position - curr_position))
    add_fuel(new_position - 1, curr_position, new_fuel_map)
  end
end
