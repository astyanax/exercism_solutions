#include "grade_school.h"

namespace grade_school {
    const std::map<int, std::vector<std::string>> school::roster() const{
        return roster_p;
    }

    void school::add(std::string name, int grade){
        auto& key = roster_p[grade];
        key.insert(std::upper_bound( key.begin(), key.end(), name ),
            std::move(name) );
    }

    const std::vector<std::string> school::grade(int grade) const{
        if (roster_p.find(grade) == roster_p.end()) {
            return std::vector<std::string>{};
        }
        return roster_p.find(grade)->second;
    }
}
