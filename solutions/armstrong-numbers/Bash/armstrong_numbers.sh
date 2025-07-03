main() {
  while read -rn 1 digit; do
    (( sum += digit**${#1} ))
  done <<< "$1"

  [ "$sum" = "$1" ] && echo "true" || echo "false"
}

main "$@"
exit 0