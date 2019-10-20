defmodule Solution do
  def run do
    [times | list] = read_list()
    times |> repeat_list(list)
  end

  defp read_list(list) do
    case IO.read(:stdio, :line) do
      :eof ->
        list

      {:error, reason} ->
        IO.puts("Error: #{reason}")

      data ->
        list = list ++ [data |> Integer.parse() |> elem(0)]
        read_list(list)
    end
  end

  defp read_list, do: read_list([])

  defp repeat_list(_, []), do: :ok

  defp repeat_list(times, list) do
    [el | list] = list
    repeat_elem(times, el)
    repeat_list(times, list)
  end

  defp repeat_elem(0, _), do: :ok

  defp repeat_elem(times, el) do
    IO.puts(el)
    repeat_elem(times - 1, el)
  end
end

Solution.run()
