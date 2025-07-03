#include "binary_search.h"

namespace binary_search {
size_t find(const std::vector<int> data, int value) {
  if (data.size() == 0)
    throw std::domain_error("data is empty.");
  size_t low{}, high{data.size() - 1};
  if (data.at(low) > value || data.at(high) < value)
    throw std::domain_error("value not found in data.");

  size_t mid{(high + low) / 2};
  int mid_value{data.at(mid)};

  while (mid_value != value) {
    if (mid_value > value) {
      high = mid - 1;
    } else {
      low = mid + 1;
    }
    if (low > high || high < low) {
      throw std::domain_error("value not found in data.");
    }
    mid = (high + low) / 2;
    mid_value = data.at(mid);
  }

  return mid;
}
} // namespace binary_search