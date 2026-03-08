defmodule Username do
  @valid_chars Enum.to_list(?a..?z) ++ [?_]
  @translation_table %{
    ?ä => [?a, ?e],
    ?ö => [?o, ?e],
    ?ü => [?u, ?e],
    ?ß => [?s, ?s]
  }

  @spec sanitize(charlist) :: charlist
  for valid <- @valid_chars do
    def sanitize([unquote(valid) | username]), do: [unquote(valid) | sanitize(username)]
  end

  for {umlaut, replacement} <- @translation_table do
    def sanitize([unquote(umlaut) | username]), do: unquote(replacement) ++ sanitize(username)
  end

  def sanitize([_invalid | username]), do: sanitize(username)
  def sanitize([]), do: []
end
