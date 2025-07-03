#include "isbn_verifier.h"

namespace isbn_verifier {
    bool is_valid(const std::string_view& isbn) {
        auto isbn10 = 0, factor = 10;
        for (char c: isbn) {
            if (c == '-')
                continue;
            bool digit_is_valid = ('0' <= c && c <= '9') || (factor == 1 && c == 'X');
            if (factor < 1 || digit_is_valid == false)
                return false;
            int digit = c == 'X' ? 10 : c - '0';
            isbn10 += digit * factor--;
        }
        return factor == 0 && isbn10 % 11 == 0;
    }
}
