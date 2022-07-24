defmodule Advent2021.Day10.Part1 do
  @points %{
    ")" => 3,
    "]" => 57,
    "}" => 1197,
    ">" => 25137
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

  defp check_lines([], errors) do
    Enum.reduce(errors, 0, fn error, sum ->
      sum + Map.get(@points, error, 0)
    end)
  end

  defp check_lines([line | lines], errors) do
    check_lines(lines, [check_line(line, []) | errors])
  end

  defp check_line([], _stack), do: nil

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
        next_char
    end
  end
end
