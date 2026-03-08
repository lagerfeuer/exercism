defmodule NameBadge do
  def print(id, name, department) when is_number(id) or is_nil(id) do
    [
      format_id(id),
      name,
      format_department(department)
    ]
    |> Enum.filter(& &1)
    |> Enum.join(" - ")
  end

  defp format_id(nil), do: nil
  defp format_id(id) when is_number(id), do: "[" <> Integer.to_string(id) <> "]"

  defp format_department(nil), do: "OWNER"
  defp format_department(department), do: String.upcase(department)
end
