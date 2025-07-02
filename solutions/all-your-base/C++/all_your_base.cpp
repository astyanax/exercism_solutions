#include "all_your_base.h"
#include <cmath>
#include <algorithm>
#include <stdexcept>

namespace all_your_base {

    const std::vector<unsigned int> convert(const unsigned int base_from,
            const std::vector<unsigned int>& digits_in, unsigned int base_to) {

        if (base_from < 2 || base_to < 2)
            throw std::invalid_argument("base");

        std::vector<unsigned int> result;
        unsigned int n = 0;

        for (const auto i: digits_in) {
            if (i >= base_from)
                throw std::invalid_argument("digit");

            n = n * base_from + i;
        }

        int max_power = static_cast<int>(std::log(n) / std::log(base_to));

        for (int p = max_power; p >= 0; --p)
        for (int k = base_to - 1; k >= 0; --k) {
            auto digit_value =  k * std::pow(base_to, p);

            if (digit_value <= n) {
                result.push_back(k);
                n -= digit_value;
                break;
            }
        }

        return result;
    }

} 