#include "reverse_string.h"

char *reverse(const char * input) {
    unsigned int len = strlen(input);
    char * output = malloc(len+1);
    memset(output, '\0', len+1);

    for (unsigned int i = 0 ; i < len ; i++) {
        output[i] = input[len-1-i];
    }
    return output;
}