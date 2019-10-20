defmodule Solution do
  def run do
    [s | tail] = String.split(IO.read(:stdio, :all), [" ", "\n"])
    {k, _} = Integer.parse(s)
    Enum.map(tail, fn x -> for _ <- 1..k, do: print(x) end)
  end

  defp print(x) do
    case Integer.parse(x) do
      {k, _} -> IO.puts(k)
      _ -> :ok
    end
  end
end

Solution.run()
