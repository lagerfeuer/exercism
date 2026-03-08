#!/bin/bash

alphabet_lo='abcdefghijklmnopqrstuvwxyz'
alphabet_up=$(echo "$alphabet_lo" | tr '[:lower:]' '[:upper:]')
alphabet_lo_rev=$(echo "$alphabet_lo" | rev)

cipher=$(echo "$2" | tr -d '[:punct:] ' | tr "$alphabet_lo$alphabet_up" "$alphabet_lo_rev$alphabet_lo_rev")
if [[ "$1" == "encode" ]]; then
  echo "$cipher" | sed 's/.\{5\}/& /g;s/ $//'
else
  echo "$cipher"
fi
