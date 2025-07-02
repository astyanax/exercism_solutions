#ifndef ISBN_VERIFIER_H
#define ISBN_VERIFIER_H

#include <string>
#include <string_view>

namespace isbn_verifier {
    bool is_valid(const std::string_view&);
}

#endif