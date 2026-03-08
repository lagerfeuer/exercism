PERSON="you"
if [[ $1 ]]; then
  PERSON="$1"  
fi
MSG="One for $PERSON, one for me."
echo $MSG