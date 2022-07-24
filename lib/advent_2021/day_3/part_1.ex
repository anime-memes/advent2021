defmodule Advent2021.Day3.Part1 do
  import Bitwise

  def run do
    "./priv/day_3_input"
    |> File.read!()
    |> String.split("\n", trim: true)
    |> Enum.map(&(&1 |> String.to_charlist() |> List.to_tuple()))
    |> run()
  end

  def run([first | _] = numbers) do
    digits_length = tuple_size(first)
    numbers_length = length(numbers)

    gamma_as_list =
      for pos <- 0..(digits_length - 1) do
        zero_count = Enum.count(numbers, &(elem(&1, pos) == ?0))
        ones_count = numbers_length - zero_count
        if zero_count > ones_count, do: ?0, else: ?1
      end

    gamma = List.to_integer(gamma_as_list, 2)
    mask = 2 ** digits_length - 1
    epsilon = ~~~gamma &&& mask

    gamma * epsilon
  end
end
