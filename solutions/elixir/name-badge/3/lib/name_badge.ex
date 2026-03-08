defmodule NameBadge do
  def print(id, name, department) when is_number(id) or is_nil(id) do
    if(id != nil, do: "[" <> Integer.to_string(id) <> "] - ", else: "") <>
      name <>
      " - " <>
      if(department != nil, do: String.upcase(department), else: "OWNER")
  end
end
