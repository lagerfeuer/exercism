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
  def first_letter(name) do
    name
    |> String.trim()
    |> String.first()
  end

  def initial(name) do
    name
    |> first_letter()
    |> String.upcase()
    |> Kernel.<>(".")
  end

  def initials(full_name) do
    [first_name, last_name] = String.split(full_name, " ")
    initial(first_name) <> " " <> initial(last_name)
  end

  def pair(full_name1, full_name2, template \\ @default_template)

  def pair(full_name1, full_name2, template) do
    template
    |> insert_initials("P. 1.", full_name1)
    |> insert_initials("P. 2.", full_name2)
  end

  defp insert_initials(template, placeholder, name) do
    String.replace(template, placeholder, initials(name))
  end
end
