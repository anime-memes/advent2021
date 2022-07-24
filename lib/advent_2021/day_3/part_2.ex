defmodule Advent2021.Day3.Part2 do
  def run do
    "./priv/day_3_input"
    |> File.read!()
    |> String.split("\n", trim: true)
    |> Enum.map(&(&1 |> String.to_charlist() |> List.to_tuple()))
    |> run()
  end

  def run(numbers) do
    oxygen_as_list = get_number(numbers, :most)
    co2_as_list = get_number(numbers, :least)

    List.to_integer(oxygen_as_list, 2) * List.to_integer(co2_as_list, 2)
  end

  defp get_number([first | _] = numbers, type) do
    digits_length = tuple_size(first)

    Enum.reduce_while(0..(digits_length - 1), numbers, fn
      _, [_] = acc ->
        {:halt, acc}

      pos, new_numbers ->
        filter_value = get_filter_value(new_numbers, pos, type)

        {:cont, Enum.filter(new_numbers, &(elem(&1, pos) == filter_value))}
    end)
    |> List.first()
    |> Tuple.to_list()
  end

  defp get_filter_value(numbers, pos, type) do
    numbers_length = length(numbers)

    zeros_count = Enum.count(numbers, &(elem(&1, pos) == ?0))
    ones_count = numbers_length - zeros_count
    get_value(zeros_count, ones_count, type)
  end

  defp get_value(zeros_count, ones_count, :most) when zeros_count > ones_count, do: ?0
  defp get_value(zeros_count, ones_count, :most) when zeros_count < ones_count, do: ?1
  defp get_value(zeros_count, ones_count, :most) when zeros_count == ones_count, do: ?1
  defp get_value(zeros_count, ones_count, :least) when zeros_count > ones_count, do: ?1
  defp get_value(zeros_count, ones_count, :least) when zeros_count < ones_count, do: ?0
  defp get_value(zeros_count, ones_count, :least) when zeros_count == ones_count, do: ?0
end
