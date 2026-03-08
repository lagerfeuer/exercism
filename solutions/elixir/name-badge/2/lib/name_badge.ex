defmodule NameBadge do
  def print(id, name, department) when is_number(id) or is_nil(id) do
    tmp =
      name <>
        " - " <>
        if department != nil, do: String.upcase(department), else: "OWNER"

    case id do
      nil -> tmp
      _ -> "[" <> Integer.to_string(id) <> "] - " <> tmp
    end
  end
end
