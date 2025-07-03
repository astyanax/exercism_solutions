#include "grade_school.h"
#include <string.h>

void init_roster(roster_t *roster) {
    roster->count = 0;
}

static int compare_students(char *name, uint8_t grade, student_t *student) {
    if (student->grade != grade)
        return (student->grade > grade ? 1 : -1);
    return strcmp(student->name, name);
}

bool add_student(roster_t *roster, char *name, uint8_t grade) {
    size_t len = strlen(name);
    size_t i = roster->count;
    for (size_t j = 0; j < roster->count; ++j)
        if (!strcmp(roster->students[j].name, name))
            return false;
    if (roster->count == MAX_STUDENTS || len > MAX_NAME_LENGTH)
        return false;
    while (i > 0 && compare_students(name, grade, roster->students + i - 1) > 0)
        --i;
    memmove(roster->students + i + 1, roster->students + i, sizeof(student_t) * (roster->count - i));
    strcpy(roster->students[i].name, name);
    roster->students[i].grade = grade;
    ++roster->count;
    return true;
}

roster_t get_grade(roster_t *roster, uint8_t grade) {
    roster_t r = { 0 };
    for (size_t i = 0; i < roster->count && roster->students[i].grade <= grade; ++i)
        if (roster->students[i].grade == grade)
            r.students[r.count++] = roster->students[i];
    return r;
}
