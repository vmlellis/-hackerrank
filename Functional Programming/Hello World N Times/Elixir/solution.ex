defmodule Solution do
  def run do
    IO.read(:stdio, :line)
      |> String.replace("\n", "")
      |> String.to_integer()
      |> print_n_times()
  end

  def print_n_times(times) do
    for i <- 0..times, i > 0, do: print_hello_world()
  end

  def print_hello_world do
    "Hello World" |> IO.puts
  end
end

Solution.run()
