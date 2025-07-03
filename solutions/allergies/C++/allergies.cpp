#include "allergies.h"

namespace allergies {
    allergy_test::allergy_test(int score) {
        const std::unordered_map<std::string, int> allergen_scores({
            {"eggs",         1},
            {"peanuts",      2},
            {"shellfish",    4},
            {"strawberries", 8},
            {"tomatoes",     16},
            {"chocolate",    32},
            {"pollen",       64},
            {"cats",         128}
        });

        for (auto x : allergen_scores) {
            if ((score & x.second) == x.second)
                allergens.emplace(x.first);
        }
    }

    bool allergy_test::is_allergic_to(std::string str) {
        return allergens.count(str);
    }

    std::unordered_set<std::string> allergy_test::get_allergies() {
        return allergens;
    }

}