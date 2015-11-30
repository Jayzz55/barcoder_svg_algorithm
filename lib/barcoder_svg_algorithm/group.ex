defmodule BarcoderSvgAlgorithm.Group do
  @doc"""
  Give a list of binary, this will group them as a list of tuples. The tuple indicate the value and quantity of the value.
  ## Examples
      iex> BarcoderSvgAlgorithm.Group.group([0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 1])
      [{0, 2}, {1, 4}, {0, 2}, {1, 1}, {0, 1}, {1, 1}]
  """
  def group([]),            do: []
  def group([head | tail]), do: group([head | tail], head, 0, [])
  defp group([], previous, count, result) do
     [{previous, count} | result] |> Enum.reverse
  end
  defp group([head | tail], head, count, result) do
    group(tail, head, count + 1, result)
  end
  defp group([head | tail], previous, count, result) do
    group(tail, head, 1, [{previous, count} | result])
  end
end
