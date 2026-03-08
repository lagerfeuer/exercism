defmodule Username do
  @translation_table %{
    ~c"ä" => ~c"ae",
    ~c"ö" => ~c"oe",
    ~c"ü" => ~c"ue",
    ~c"ß" => ~c"ss"
  }
  @valid_chars Enum.to_list(?a..?z) ++ Map.keys(@translation_table) ++ [?_]

  def sanitize(username) do
    username
    |> translate()
  end

  def translate([char | username]) do
    case convert(char) do
      [umlaut, addition] -> [umlaut, addition | translate(username)]
      nil -> translate(username)
      converted -> [converted | translate(username)]
    end
  end

  def translate([]), do: []

  @spec convert(char) :: charlist | char | nil
  for {from, to} <- @translation_table do
    def convert(unquote(from)), do: unquote(to)
  end

  def convert(valid_char) when valid_char in @valid_chars, do: valid_char
  def convert(_), do: nil
end
