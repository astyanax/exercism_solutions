#include "binary.h"

namespace binary {
    int convert(std::string_view str) {
        int decimal = 0;
        int multiplier = 1;
    
        for (auto it = str.end() - 1; it >= str.begin(); it--) {
            if (std::isdigit(*it) == 0) {
                return 0;
            }
            decimal += (*it - '0') * multiplier;
            multiplier *= 2;
        }
        return decimal;
    }
} 
