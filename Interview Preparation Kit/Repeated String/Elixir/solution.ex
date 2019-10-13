defmodule Solution do
  def run do
    s = read_line()
    n = read_line() |> String.to_integer()

    solve(s, n) |> IO.write()
  end

  defp read_line do
    IO.read(:stdio, :line) |> String.replace("\n", "")
  end

  defp solve(s, n) do
    count = s |> String.length()
    count_a = s |> counter()
    times = div(n, count)
    substr_count = s |> counter_substr(n - times * count)
    times * count_a + substr_count
  end

  defp counter_substr(s, n) do
    s |> String.slice(0, n) |> counter()
  end

  defp counter(s) do
    s |> String.graphemes() |> Enum.count(&(&1 == "a"))
  end
end

Solution.run()
