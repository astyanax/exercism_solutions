#ifndef ALLERGIES_H
#define ALLERGIES_H

#include <unordered_set>
#include <unordered_map>
#include <string>

namespace allergies {
    class allergy_test
    {
    private:
        std::unordered_set<std::string> allergens;
    public:
        std::unordered_set<std::string> get_allergies();
        bool is_allergic_to(std::string str);
        allergy_test(int score);
    };

}

#endif