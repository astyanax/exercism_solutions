#include "secret_handshake.h"

const char **commands(size_t n) {
    const char * actions[] = { "wink", "double blink", "close your eyes", "jump" };
    const char **output = calloc(4, sizeof(char *));
    int action = 0, i = 1, output_idx = 0, end = 4;
    if (n & 16) {action = 3; i = -1; end = -1;}

    // Handle both normal and reverse sequence in one block
    for (; action != end; action+=i)
        if (n & 1 << action)
            output[output_idx++] = actions[action];
    return output;
}