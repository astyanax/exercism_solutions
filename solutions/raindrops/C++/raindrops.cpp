#include "raindrops.h"

namespace raindrops {
    std::string convert(unsigned int n) {
        std::string out = "";

        if (n % 3 == 0) {
            out += "Pling";
        }
        if (n % 5 == 0) {
            out += "Plang";
        }
        if (n % 7 == 0) {
            out += "Plong";
        }

        if (out != "") {
            return out;
        }
        return std::to_string(n);
    }
}
