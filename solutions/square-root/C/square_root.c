#include "square_root.h"

int64_t square_root(int64_t radicand) {
    int64_t q = 1, r = 0;
    while (q <= radicand) {
        q *= 4;
    }

    while (q > 1) {
        int64_t t;
        q >>= 2;
        t = radicand - r - q;
        r >>= 1;
        if (t >= 0) {
            radicand = t;
            r += q;
        }
    }
    return r;
}