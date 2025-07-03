#!/usr/bin/env bash

generate() {
  echo strength "$(shuf -i 3-18 -n 1)"
  echo dexterity "$(shuf -i 3-18 -n 1)"
  cons="$(shuf -i 3-18 -n 1)"
  echo constitution "$cons"
  echo intelligence "$(shuf -i 3-18 -n 1)"
  echo wisdom "$(shuf -i 3-18 -n 1)"
  echo charisma "$(shuf -i 3-18 -n 1)"
  echo hitpoints $(( 10 + $(modifier "$cons") ))
}

modifier() {
  local val=$(( $1 - 10 ))
  local res
  if (( val >= 0 )); then
    res=$(echo "$val / 2" | bc)
  else
    res=$(echo "($val - 1) / 2" | bc)
  fi
  echo "$res"
}

"$@"
