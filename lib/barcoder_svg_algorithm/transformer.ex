defmodule BarcoderSvgAlgorithm.Transformer do
  @doc"""
  test
  ## Examples
      iex> BarcoderSvgAlgorithm.Transformer.transform([0,1,1,1,0,0,0,1])
      [{1, 3}, {7, 1}]
      iex> BarcoderSvgAlgorithm.Transformer.transform([1,0,0,1,1])
      [{0, 1}, {3, 2}]
  """
  def transform(list) do
    list 
    |> first_transform
    |> second_transform

  end


  @doc"""
  test
  ## Examples
      iex> BarcoderSvgAlgorithm.Transformer.first_transform([0,1,1,1,0,0,0,1])
      [{1, 1}, {2, 1}, {3, 1}, {7, 1}]
      iex> BarcoderSvgAlgorithm.Transformer.first_transform([1,0,0,1,1])
      [{0, 1}, {3, 1}, {4, 1}]
  """
  def first_transform(list) do
    first_map(list, 0, [])
  end

  defp first_map([], _index, acc), do: acc |> Enum.reverse 
  defp first_map([0 | tail], index, acc), do: first_map(tail, index + 1, acc)
  defp first_map([head | tail], index, acc), do: first_map(tail, index + 1, [ {index, head} | acc ])

  @doc"""
  test
  ## Examples
      iex> BarcoderSvgAlgorithm.Transformer.second_transform([{1, 1}, {2, 1}, {3, 1}, {7, 1}])
      [{1, 3}, {7, 1}]
      iex> BarcoderSvgAlgorithm.Transformer.second_transform([{0, 1}, {3, 1}, {4, 1}])
      [{0, 1}, {3, 2}]
  """
  def second_transform(list) do
    second_map(list, [], [])
  end

  defp second_map([],_, acc), do: acc |> Enum.reverse
  defp second_map([head | tail], [], acc), do: second_map(tail, head, [ head | acc])
  defp second_map([{index, width} | tail], {prev_index, prev_width}, [ {init_head, _} | remainders]) when index == prev_index + 1, do: second_map(tail, {index, prev_width+width}, [{init_head, prev_width+width} | remainders])
  defp second_map([head | tail], prev_head, acc), do: second_map(tail, head, [ head | acc ])

end
