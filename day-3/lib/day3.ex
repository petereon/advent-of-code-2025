defmodule Day3 do
  require File
  # require Stream
  def find_largest_joltage (bank) do
    batteries = bank |> String.graphemes |> Stream.map(&String.to_integer/1)
    max_val_non_last = Enum.max(Enum.drop(batteries, -1))
    index_of_max = Enum.find_index(batteries, fn x -> x === max_val_non_last end)
    second_val = Enum.max(Enum.drop(batteries, index_of_max + 1))
    String.to_integer("#{max_val_non_last}#{second_val}")
  end


  def main do
    stream = File.stream!("data/input.txt")
      |> Stream.map(&String.trim/1)
      |> Stream.map(&find_largest_joltage/1)
    Enum.sum(stream) |> IO.puts
  end


end
