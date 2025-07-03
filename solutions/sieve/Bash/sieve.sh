#!/usr/bin/env bash

main () {
    local limit=$1
    local -a is_prime

    # Initialize all numbers as prime
    for ((i=2; i<=limit; i++)); do
        is_prime[$i]=1
    done

    # Apply Sieve of Eratosthenes
    for ((i=2; i*i<=limit; i++)); do
        if [[ ${is_prime[$i]} -eq 1 ]]; then
            for ((j=i*i; j<=limit; j+=i)); do
                is_prime[$j]=0
            done
        fi
    done

    # Print prime numbers
    local output=""
    for ((i=2; i<=limit; i++)); do
        if [[ ${is_prime[$i]} -eq 1 ]]; then
            output+="$i "
        fi
    done
    echo "${output% }"
}

main "$@"