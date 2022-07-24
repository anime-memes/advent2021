defmodule Advent2021.MixProject do
  use Mix.Project

  def project do
    [
      app: :advent_2021,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:nx, "~> 0.2.1"}
    ]
  end
end
