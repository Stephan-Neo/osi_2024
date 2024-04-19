#!/bin/bash
> report.log
declare -a array
count=0

while true; do
  array+=({1..10})
  let count+=1
  if (( count % 100000 == 0 )); then
    echo "${#array[@]}" >> report.log
  fi
done
