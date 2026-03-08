import String, only: [split: 2, trim: 1, first: 1, upcase: 1, replace: 3]

defmodule HighSchoolSweetheart do
  @default_template """
       ******       ******
     **      **   **      **
   **         ** **         **
  **            *            **
  **                         **
  **     P. 1.  +  P. 2.     **
   **                       **
     **                   **
       **               **
         **           **
           **       **
             **   **
               ***
                *
  """
  def first_letter(name), do: first(trim(name))

  def initial(name), do: upcase(first_letter(name)) <> "."

  def initials(full_name) do
    [first_name, last_name] = split(full_name, " ")
    initial(first_name) <> " " <> initial(last_name)
  end

  def pair(full_name1, full_name2), do: pair(full_name1, full_name2, @default_template)

  defp pair(full_name1, full_name2, template) do
    template
    |> insert_initials("P. 1.", full_name1)
    |> insert_initials("P. 2.", full_name2)
  end

  defp insert_initials(template, placeholder, name),
    do: replace(template, placeholder, initials(name))
end
