#include "hamming.h"
#include <string.h>

int compute(const char *lhs, const char *rhs) {
    if (lhs == NULL || rhs == NULL)
        return -1;
    if (strlen(lhs) != strlen(rhs))
        return -1;
    int hamming_dist = 0;
        
    for (int i = 0 ; lhs[i] != '\0' ; i++)
        hamming_dist += lhs[i] != rhs[i];
    return hamming_dist;
}