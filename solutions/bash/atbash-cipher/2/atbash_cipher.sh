#!/bin/bash

alpha_rev=""
for letter in {z..a}; do
  alpha_rev+="$letter"
done

cipher=$(echo "${2,,}" | tr -d '[:punct:] ' | tr 'a-z' "$alpha_rev")
if [[ "$1" == "encode" ]]; then
  echo "$cipher" | sed 's/.\{5\}/& /g;s/ $//'
else
  echo "$cipher"
fi
