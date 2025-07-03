#!/usr/bin/env bash
word=${1,,}
word=${word//[ -]/}
declare -A letters

for ((i=0; i<${#word}; i++)); do
    [[ -n ${letters[${word:i:1}]} ]] && { echo 'false' ; exit 0 ; }
    letters[${word:i:1}]=1
done

echo 'true'