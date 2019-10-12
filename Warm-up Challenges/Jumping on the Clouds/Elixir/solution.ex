defmodule Solution do
  def run do
    IO.read(:stdio, :line)
    IO.read(:stdio, :line)
      |> String.replace("\n", "")
      |> String.split(" ")
      |> Enum.map(&(String.to_integer(&1)))
      |> solve
      |> IO.write
  end

  def solve(clouds) do
    [_ | clouds] = clouds
    clouds |> jump(0)
  end

  def jump([_, b | t], sum) when b == 0 do
    jump(t, sum + 1)
  end

  def jump([_ | t], sum) do
    jump(t, sum + 1)
  end

  def jump([], sum), do: sum
end

Solution.run()
