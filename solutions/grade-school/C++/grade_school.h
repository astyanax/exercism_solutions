#ifndef GRADE_SCHOOL_H
#define GRADE_SCHOOL_H

#include <algorithm>
#include <string>
#include <map>
#include <vector>

namespace grade_school {
    class school{
        private:
            std::map<int, std::vector<std::string>> roster_p;
        public:
            const std::map<int, std::vector<std::string>> roster() const;
            const std::vector<std::string> grade(int grade) const;
            void add(std::string name, int grade);
    };
}

#endif