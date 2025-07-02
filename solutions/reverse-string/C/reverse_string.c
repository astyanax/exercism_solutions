#include "reverse_string.h"

char *reverse(const char * input) {
    unsigned int len = strlen(input);
    char * output = calloc(len+1, 1);

    for (unsigned int i = 0 ; i < len ; i++) {
        output[i] = input[len-1-i];
    }
    return output;
}