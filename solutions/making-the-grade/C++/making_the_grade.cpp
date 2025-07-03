#include <array>
#include <string>
#include <vector>
#include <algorithm>

// Round down all provided student scores.
std::vector<int> round_down_scores(std::vector<double> student_scores) {
    std::vector<int> rounded_student_scores;
    for (std::vector<double>::iterator iter = student_scores.begin() ; iter < student_scores.end() ; iter++ ) {
        rounded_student_scores.push_back(int(*iter));
    }
    return rounded_student_scores;
}


// Count the number of failing students out of the group provided.
int count_failed_students(std::vector<int> student_scores) {
    //std::copy_if(begin(student_scores), end(student_scores), std::back_inserter(out), [](float m){return m<=40;});
    int count = 0;
    for (std::vector<int>::iterator iter = student_scores.begin() ; iter < student_scores.end() ; iter++ ) {
       if (*iter <= 40) {
           ++count;
       }
    }
    return count;
}

// Determine how many of the provided student scores were 'the best' based on the provided threshold.
std::vector<int> above_threshold(std::vector<int> student_scores, int threshold) {
    std::vector<int> filtered_scores;
    for (std::vector<int>::iterator iter = student_scores.begin() ; iter < student_scores.end() ; iter++ ) {
        if (*iter >= threshold)
            filtered_scores.push_back(*iter);
    }
    return filtered_scores;
}

// Create a list of grade thresholds based on the provided highest grade.
std::array<int, 4> letter_grades(int highest_score) {
    int interval = (highest_score - 40) / 4;
    return {41, 41 + interval, 41 + 2*interval, 41 + 3*interval};
}

// Organize the student's rank, name, and grade information in ascending order.
std::vector<std::string> student_ranking(std::vector<int> student_scores, std::vector<std::string> student_names) {
    std::vector<std::string> rankings;
    for (auto i = 0; i < student_scores.size(); i++)
        rankings.emplace_back(std::to_string(i + 1) + ". " + student_names.at(i) + ": " + std::to_string(student_scores.at(i)));
    return rankings;
}

// Create a string that contains the name of the first student to make a perfect score on the exam.
std::string perfect_score(std::vector<int> student_scores, std::vector<std::string> student_names) {
    for (auto i = 0; i < student_scores.size(); i++) {
        if (student_scores.at(i) == 100)
            return student_names.at(i);
    }
    return "";
}