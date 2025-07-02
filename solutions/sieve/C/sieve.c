#include "sieve.h"

uint32_t sieve(uint32_t limit, uint32_t *primes, size_t primes_capacity)
{
    if (primes_capacity == 0 || limit < 2) return 0;

    uint32_t num_primes = 0;
    uint32_t is_prime[limit + 1];
    memset(is_prime, 1, (limit+1) * sizeof(uint32_t));

    for (uint32_t i = 2; i <= limit; i++) {
        if (is_prime[i]){
            primes[num_primes++] = i;
            if (num_primes >= primes_capacity) break;
            for (uint32_t j = 2; i * j <= limit; j++) is_prime[i * j] = 0;
        }
    }

    return num_primes;
}