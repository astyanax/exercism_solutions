#include "isogram.h"
#include <stdio.h>
#include <ctype.h>
#include <stdint.h>

bool is_isogram(const char phrase[]) {
    if (!phrase)
        return false;

    uint_fast32_t alpha_mask = 0;
    
    for (uint_fast64_t i = 0 ; phrase[i] != '\0' ; i++) {
        if (!isalpha(phrase[i])) {
             continue;
        }
        char lower = tolower((unsigned char)phrase[i]);

        if ((1 << (lower - 'a')) & alpha_mask) return 0;
        alpha_mask |= (1 << (lower - 'a'));
    }
    return true;
}