defmodule Identicon do
  def main(input) do
    input
    |> hash_input
    |> pick_color
  end

  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
          |> :binary.bin_to_list
    %Identicon.Image{hex: hex}
  end

  # Pattern match on the image argument.
  def pick_color(%Identicon.Image{hex: [r, g, b | _tail]} = image) do
    # Update the structure using the | operator to append the color property.
    %Identicon.Image{image | color: {r, g, b}}
  end
end
