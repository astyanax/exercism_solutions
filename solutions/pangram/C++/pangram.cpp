#include "pangram.h"

namespace pangram {
    bool is_pangram(const std::string& sentence) {
        if(sentence.length() < 26)
            return false;

        std::unordered_set<char> letters;
        for(char i : sentence) {
            char c = std::tolower(i);
            if(std::isalpha(c))
                letters.emplace(c);
        }
        return (letters.size() == 26);
    }
}
