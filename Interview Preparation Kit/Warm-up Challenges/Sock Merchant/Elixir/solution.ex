defmodule Solution do
  def run do
    IO.read(:stdio, :line)
    IO.read(:stdio, :line)
      |> String.replace("\n", "")
      |> String.split(" ")
      |> Enum.map(fn n -> String.to_integer(n) end)
      |> solve
      |> IO.write
  end

  def solve(socks) do
    socks
      |> Enum.reduce(%{}, fn x, arr -> Map.update(arr, x, 1, &(&1 + 1)) end)
      |> Map.values
      |> Enum.map(fn n -> div(n, 2) end)
      |> Enum.sum
  end
end

Solution.run()
