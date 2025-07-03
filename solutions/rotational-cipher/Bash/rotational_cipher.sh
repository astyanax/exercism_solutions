#!/usr/bin/env bash
r_cipher() {
  declare -A letters

  alpha="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
  rot="${alpha:$2:$((26 - $2))}${alpha::$2}"
  rot+="${alpha:$((26 + $2))}${alpha:26:$2}"

  for ((i = 0; i < ${#alpha}; i++)); do
    letters["${alpha:i:1}"]="${rot:i:1}"
  done

  for ((i = 0; i < ${#1}; i++)); do
    chr="${1:$i:1}"
    [[ "${letters["$chr"]}" ]] && result+="${letters[$chr]}" || result+="$chr"
  done
  echo "$result"
}

r_cipher "$@"
