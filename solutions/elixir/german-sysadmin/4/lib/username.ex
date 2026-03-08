defmodule Username do
  @translations [
    {?ä, [?a, ?e]},
    {?ö, [?o, ?e]},
    {?ü, [?u, ?e]},
    {?ß, [?s, ?s]},
    {?_, ?_}
    | Enum.map(?a..?z, &{&1, &1})
  ]

  @spec sanitize(charlist) :: charlist
  Enum.each(@translations, fn
    {umlaut, [repl1, repl2]} ->
      def sanitize([unquote(umlaut) | username]),
        do: [unquote(repl1), unquote(repl2) | sanitize(username)]

    {valid, valid} ->
      def sanitize([unquote(valid) | username]), do: [unquote(valid) | sanitize(username)]
  end)

  def sanitize([_invalid | username]), do: sanitize(username)
  def sanitize([]), do: []
end
