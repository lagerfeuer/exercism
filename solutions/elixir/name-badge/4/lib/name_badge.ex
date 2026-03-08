defmodule NameBadge do
  def print(id, name, department) when is_number(id) or is_nil(id) do
    if(id, do: "[#{id}]" <> " - ", else: "") <>
      name <>
      " - " <>
      if(department, do: String.upcase(department), else: "OWNER")
  end
end
