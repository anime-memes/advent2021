defmodule Advent2021.Day10.Part2 do
  @points %{
    "(" => 1,
    "[" => 2,
    "{" => 3,
    "<" => 4
  }

  @opening ["(", "[", "{", "<"]
  @closing %{
    "(" => ")",
    "[" => "]",
    "{" => "}",
    "<" => ">"
  }

  def run do
    "./priv/day_10_input"
    |> File.read!()
    |> run()
  end

  def run(input) do
    input
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&String.split(&1, "", trim: true))
    |> check_lines([])
  end

  defp check_lines([], stacks) do
    scores =
      stacks
      |> Enum.reject(&is_nil/1)
      |> Enum.map(fn stack ->
        Enum.reduce(stack, 0, fn char, sum ->
          sum * 5 + Map.get(@points, char, 0)
        end)
      end)
      |> Enum.sort()

    mid = (length(scores) / 2) |> floor()
    Enum.at(scores, mid)
  end

  defp check_lines([line | lines], stacks) do
    check_lines(lines, [check_line(line, []) | stacks])
  end

  defp check_line([], []), do: nil
  defp check_line([], stack), do: stack

  defp check_line([char | line], stack) when char in @opening do
    check_line(line, [char | stack])
  end

  defp check_line([char | line], [char | stack]) do
    check_line(line, stack)
  end

  defp check_line([next_char | line], [stack_char | stack]) do
    case Map.get(@closing, stack_char) do
      ^next_char ->
        check_line(line, stack)

      _ ->
        nil
    end
  end
end
