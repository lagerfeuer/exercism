defmodule HighSchoolSweetheart do
  for skip <- ~c[ \n\r\t] do
    def first_letter(unquote(<<skip>>) <> name), do: first_letter(name)
  end

  def first_letter(<<first::binary-size(1)>> <> _), do: first

  def initial(name), do: String.upcase(first_letter(name)) <> "."

  def initials(full_name) do
    full_name |> String.split(" ") |> Enum.map_join(" ", &initial/1)
  end

  def pair(full_name1, full_name2) do
    i1 = initials(full_name1)
    i2 = initials(full_name2)

    """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     #{i1}  +  #{i2}     **
     **                       **
       **                   **
         **               **
           **           **
             **       **
               **   **
                 ***
                  *
    """
  end
end
