#ifndef PANGRAM_H
#define PANGRAM_H

#include <algorithm>
#include <bitset>
#include <cctype>
#include <string>
#include <string_view>

namespace pangram {
    bool is_pangram(std::string_view sentence);
}

#endif
