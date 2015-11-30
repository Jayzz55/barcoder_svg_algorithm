defmodule BarcoderSvgAlgorithm.SvgBuilder do
  import BarcoderSvgAlgorithm.Group

  @doc """
  Give a list of binary, this will build the svg path.
  ## Examples
      iex> BarcoderSvgAlgorithm.SvgBuilder.path([1,0,0,1,1])
      "v10h1V1h2v10h2V1"
  """
  def path(list) do
    grouped_list = group(list)
    build_path(grouped_list, "")
  end
  defp build_path([], acc), do: acc
  defp build_path([ {1, width} | tail ], acc), do: build_path(tail, acc <> "v10h#{width}V1")
  defp build_path([ {0, width} | tail ], acc), do: build_path(tail, acc <> "h#{width}")

  @doc """
  Given a list of binary, this will build a barcoded svg.
  ## Examples
      iex> BarcoderSvgAlgorithm.SvgBuilder.build_svg([1,0,0,1,1])
      "<svg version='1.1' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 200 100'><path d='M1 1v10h1V1h2v10h2V1 Z'></path></svg>"
  """
  def build_svg(list) do
    svg_path = path(list)
    "<svg version='1.1' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 200 100'><path d='M1 1#{svg_path} Z'></path></svg>"
  end

end
