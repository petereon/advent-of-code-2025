defmodule Day3 do
  require File
  # require Stream
  def find_largest_joltage(bank, num_batteries) do
    list = bank |> String.graphemes |> Enum.map(&String.to_integer/1)
    batteries = find_largest_in_sublist(list, num_batteries, [])
    String.to_integer(Enum.join(batteries))
  end


def find_largest_in_sublist(sublist, num_batteries, found) do
    if sublist == [] or Enum.count(found) == num_batteries do
      found
    else
      # Calculate how many more digits we need
      remaining_needed = num_batteries - Enum.count(found)
      # We need to keep at least (remaining_needed - 1) digits after our choice
      searchable_length = length(sublist) - (remaining_needed - 1)

      # Find max in the searchable portion
      max_val_sublist = Enum.take(sublist, searchable_length) |> Enum.max()
      index_of_max = Enum.find_index(sublist, fn x -> x === max_val_sublist end)
      find_largest_in_sublist(Enum.drop(sublist, index_of_max + 1), num_batteries, found ++ [max_val_sublist])
    end
  end



  def main do
    stream = File.stream!("data/input.txt")
      |> Stream.map(&String.trim/1)
      |> Stream.map(fn x -> find_largest_joltage(x, 12) end )
    Enum.sum(stream) |> IO.puts
  end


end
