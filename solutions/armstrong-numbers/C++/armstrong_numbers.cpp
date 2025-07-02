#include "armstrong_numbers.h"

namespace armstrong_numbers {
    bool is_armstrong_number(unsigned int number) {
        unsigned int order = log10(number) + 1, sum = 0;
        for (unsigned int i = 0 ; i < order ; i++)
            sum += pow(( (number / (unsigned int)pow(10, i)) % 10), order);
        return sum == number;
    }
}
