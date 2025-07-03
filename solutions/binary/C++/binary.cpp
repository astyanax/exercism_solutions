#include "binary.h"

namespace binary {
    int convert(std::string_view str) {
        int decimal = 0;
    
        for (char c : str) {
            if (c != '0' && c != '1') {
                return 0;
            }
            decimal = (decimal << 1) | (c - '0');
        }
        return decimal;
    }
} 
