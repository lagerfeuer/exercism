#!/bin/bash

function bob () {
  input=$(echo "$1" | tr -d '\n\r\t' | tr -s ' ' | sed -e 's/[[:space:]]*$//')
  if [[ ! $input ]]; then
    echo "Fine. Be that way!"
  elif [[ $input =~ ^[A-Z\ ]+\?$ ]]; then
    echo "Calm down, I know what I'm doing!"
  elif [[ $input =~ ^([A-Za-z0-9,\ :\(\)!\.]+)+\?$ ]]; then
    echo "Sure."
  elif [[ "$input" == "${input^^}" && $input =~ [A-Z] ]]; then
    echo "Whoa, chill out!"
  else
    echo "Whatever."
  fi
}

bob "$1"
