#include "pangram.h"

namespace pangram {
    const std::string abc = "abcdefghijklmnopqrstuvwxyz";

    bool is_pangram(std::string_view sentence) {
        std::bitset<26> letters;
        for (const auto c : sentence)
            if (std::isalpha(c))
                letters.set((std::tolower(c) - 'a') % 26);
        return letters.all();
    }
}
