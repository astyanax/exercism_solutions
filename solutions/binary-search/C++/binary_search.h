#ifndef BINARY_SEARCH_H
#define BINARY_SEARCH_H

#include <cstddef>
#include <stdexcept>
#include <vector>        

namespace binary_search {
    size_t find(const std::vector<int> data, int value);
}

#endif