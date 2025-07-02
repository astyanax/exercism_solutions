#include "isogram.h"
#include <stdio.h>
#include <ctype.h>

bool is_isogram(const char phrase[]) {
    if (!phrase)
        return false;

    int map[26] = {0};
    
    for (int i = 0 ; phrase[i] != '\0' ; i++) {
        if (phrase[i] == '-' || phrase[i] == ' ') {
             continue;
        }
        char l = tolower(phrase[i]);
        if (map[l-'a'] == 1)
            return false;
        map[l-'a'] = 1;
    }
    return true;
}