defmodule Solution do
  def run do
    IO.read(:stdio, :line)

    IO.read(:stdio, :line)
    |> String.replace("\n", "")
    |> String.graphemes()
    |> solve()
    |> IO.write()
  end

  def solve(paths) do
    paths |> step(0, 0)
  end

  def step([path | t], altitude, valleys) do
    altitude = path |> calc_altitude(altitude)
    valleys = path |> calc_valleys(altitude, valleys)
    t |> step(altitude, valleys)
  end

  def step([], _, valleys), do: valleys

  def calc_altitude("U", altitude), do: altitude + 1
  def calc_altitude(_, altitude), do: altitude - 1

  def calc_valleys("U", 0, valleys), do: valleys + 1
  def calc_valleys(_, _, valleys), do: valleys
end

Solution.run()
