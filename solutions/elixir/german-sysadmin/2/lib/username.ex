defmodule Username do
  @valid_chars Enum.to_list(?a..?z) ++ [?_]
  @umlauts [?ä, ?ö, ?ü, ?ß]

  @spec sanitize(charlist) :: charlist
  def sanitize(username) do
    username
    |> translate()
  end

  # @spec translate(charlist) :: charlist
  defp translate([char | username]) when char in @valid_chars, do: [char | translate(username)]

  defp translate([umlaut | username]) when umlaut in @umlauts do
    case umlaut do
      ?ä -> ~c"ae"
      ?ö -> ~c"oe"
      ?ü -> ~c"ue"
      ?ß -> ~c"ss"
    end ++ translate(username)
  end

  defp translate([_ | username]), do: translate(username)
  defp translate([]), do: []
end
