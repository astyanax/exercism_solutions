#include "acronym.h"

char *abbreviate(const char *phrase) {
    if (!phrase || strlen(phrase) == 0) {
        return NULL;
    }

    int word_count = 1;
    for (int i = 0; phrase[i]; i++) {
        if (phrase[i] == ' ' || phrase[i] == '-') {
            word_count++;
        }
    }

    char *result = (char *)malloc(word_count + 1);
    if (!result) {
        return NULL;
    }

    int j = 0;
    if (phrase[0]) {
        result[j++] = toupper(phrase[0]);
    }

    for (int i = 1; phrase[i]; i++) {
        if ((phrase[i-1] == ' ' || phrase[i-1] == '-' || phrase[i-1] == '_') &&
            isalpha(phrase[i])) {
            result[j++] = toupper(phrase[i]);
        }
    }

    result[j] = '\0';
    return result;
}
