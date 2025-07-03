#!/usr/bin/env bash

main() {
    IFS=' -_*' read -r -a words <<< "${1^^}"
    for w in "${words[@]}"; do
        echo -n ${w:0:1}
    done
}

main "$@"