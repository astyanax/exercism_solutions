#include "grains.h"

namespace grains {
    unsigned long long square(int n) {
        return 1ULL << (n-1);
    }

    unsigned long long total(void) {
        return ~(2ULL << 63);
    }
}