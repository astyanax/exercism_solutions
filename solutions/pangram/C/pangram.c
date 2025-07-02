#include "pangram.h"

#define ALPHABET_SIZE 26

bool is_pangram(const char* sentence) {
    if (!sentence) return false;
    int array[ALPHABET_SIZE] = {0};
    
    for (size_t i = 0; i < strlen(sentence); i++) {
        if (sentence[i] >= 'A' && sentence[i] <= 'Z') array[(int)sentence[i] - 65]++;
        if (sentence[i] >= 'a' && sentence[i] <= 'z') array[(int)sentence[i] - 97]++;
    }
    for (int i = 0; i < ALPHABET_SIZE; i++)
        if (array[i] == 0) return false;
    return true;
}