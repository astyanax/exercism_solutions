#!/bin/sh

[[ "${1}" =~ .*\?[[:space:]]*$ ]] && question="1" || question="0"
[[ "${1^^}" == "${1}" && "${1^^}" =~ .*[A-Z].* ]] && upper="1" || upper="0"

if [[ "${1}" =~ ^[[:space:]]*$ ]]; then
    echo "Fine. Be that way!"
    exit 0
fi

case "${upper}${question}" in
    "11")
        echo "Calm down, I know what I'm doing!"
        ;;
    "01")
        echo "Sure."
        ;;
    "10")
        echo "Whoa, chill out!"
        ;;
    "00")
        echo "Whatever."
        ;;
esac