#include "sieve.h"

namespace sieve {

std::vector<int> primes(int num) {
  std::set<int> potential_primes {};

  for (auto i = 2; i <= num; ++i)
    potential_primes.insert(i);

  std::vector<int> primes {};

  while (potential_primes.empty() == false) {
    auto j = *potential_primes.begin();

    primes.push_back(j);
    for (auto i = 1; i * j <= num; ++i)
      potential_primes.erase(i * j);
  }

  return primes;
}
} // namespace sieve