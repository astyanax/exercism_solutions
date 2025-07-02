#include "armstrong_numbers.h"

bool armstrong_numbers::is_armstrong_number(const int n) noexcept {
    const int order = (n <= 0)? 0: std::log10(n) + 1;
    int sum = 0;
    for (int i = n; i > 0; i /= 10)
        sum += std::pow(i % 10, order);
    return sum == n;
}