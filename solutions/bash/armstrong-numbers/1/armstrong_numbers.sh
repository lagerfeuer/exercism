#!/bin/bash

num=$1
len=${#num}
num_test=0

for i in $(seq $len); do
  curr_num="${num:$((i-1)):1}"
  num_test=$((num_test + curr_num ** len))
done

if (( num == num_test )); then
  echo "true"
else
  echo "false"
  exit 1
fi
