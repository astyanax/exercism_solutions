#include "scrabble_score.h"

unsigned int score(const char *word) {
    unsigned int scorei32 = 0;
    for (size_t i = 0 ; i < strlen(word); i++) {
        char c = toupper(word[i]);
        switch(c) {
            case 'A': case 'E': case 'I': case 'O': case 'U':
            case 'L': case 'N': case 'R': case 'S': case 'T':
                scorei32 += 1;
                break;
            case 'D': case 'G':
                scorei32 += 2;
                break;
            case 'B': case 'C': case 'M': case 'P':
                scorei32 += 3;
                break;
            case 'F': case 'H': case 'V': case 'W': case 'Y':
                scorei32 += 4;
                break;
            case 'K':
                scorei32 += 5;
                break;
            case 'J': case 'X':
                scorei32 += 8;
                break;
            case 'Q': case 'Z':
                scorei32 += 10;
                break;
        }
    }
    return scorei32;
}
