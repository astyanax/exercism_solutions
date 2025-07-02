#include "isogram.h"
#include <stdio.h>
#include <ctype.h>

bool is_isogram(const char phrase[]) {
    if (!phrase)
        return false;

    int i = 0;
    int map[26] = {0};
    
    while (phrase[i] != '\0') {
        printf("%d: %c\n", i, phrase[i]);
        if (phrase[i] == '-' || phrase[i] == ' ') {
             ++i;
             continue;
        }
        char l = tolower(phrase[i]);
        if (map[l-'a'] == 1)
            return false;
        map[l-'a'] = 1;
        ++i;
    }
    return true;
}