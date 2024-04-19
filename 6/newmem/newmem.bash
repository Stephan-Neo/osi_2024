#!/bin/bash

exec > report.log

if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: $0 <N> <K>"
  exit 1
fi

N=$1
K=$2

start_time=$(date +%s)
echo "Script started at $(date)"
echo "Target array size is $N, repeats $K times"

for (( i = 0; i < K; i++ )); do
  declare -a array
  while [ ${#array[@]} -lt $N ]; do
    array+=({1..10})
  done
  echo "Iteration $((i + 1)): Array reached size $N"
done

end_time=$(date +%s)
duration=$((end_time - start_time))

echo "Script finished at $(date)"
echo "Total runtime was $duration seconds."
