#include "high_scores.h"

#include <algorithm>

namespace arcade {
    std::vector<int> HighScores::list_scores() {
        return scores;
    }

    int HighScores::latest_score() {
        return scores.back();
    }

    int HighScores::personal_best() {
        return *std::max_element(scores.begin(), scores.end());
    }

    std::vector<int> HighScores::top_three() {
        std::vector<int> top3{scores};
        std::sort(top3.begin(), top3.end(), std::greater{});
        top3.resize(std::min(size_t(3), scores.size()));
        return top3;
    }
}
