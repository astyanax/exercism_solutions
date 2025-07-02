#include <math.h>
#include "armstrong_numbers.h"

bool is_armstrong_number(int candidate)
{
    int res = 0;
    int order = log10(candidate) + 1;
    for (int i = candidate ; i > 0 ; i /= 10)
        res += pow(i % 10, order);
    return candidate == res;
}
