defmodule Advent2021.Day6.Part2Nx do
  import Nx, only: :sigils

  @epochs 256

  @matrix ~M"""
    0 0 0 0 0 0 1 0 1
    1 0 0 0 0 0 0 0 0
    0 1 0 0 0 0 0 0 0
    0 0 1 0 0 0 0 0 0
    0 0 0 1 0 0 0 0 0
    0 0 0 0 1 0 0 0 0
    0 0 0 0 0 1 0 0 0
    0 0 0 0 0 0 1 0 0
    0 0 0 0 0 0 0 1 0
  """

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

    tensor =
      Enum.map(0..8, fn i -> frequencies[i] || 0 end)
      |> Nx.tensor()

    1..@epochs
    |> Enum.reduce(tensor, fn _, tensor -> Nx.dot(tensor, @matrix) end)
    |> Nx.sum()
    |> Nx.to_number()
  end
end
