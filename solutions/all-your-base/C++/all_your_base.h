#if !defined(ALL_YOUR_BASE_H)
#define ALL_YOUR_BASE_H

#include <vector>

namespace all_your_base {

    const std::vector<unsigned int> convert(const unsigned int base_from, const std::vector<unsigned int>& digits_in, unsigned int base_to);

}  // namespace all_your_base

#endif // ALL_YOUR_BASE_H
