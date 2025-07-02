#include "difference_of_squares.h"
#include <stdlib.h>
//#include <math.h>

unsigned int sum_of_squares(unsigned int number) {
    unsigned int sum = 0;

    for (unsigned int i = 1; i <= number; ++i) {
        sum += i * i;
    }

    return sum;
    //return (n * (n + 1) * (2 * n + 1)) / 6;
}

unsigned int square_of_sum(unsigned int number) {
    unsigned int square = 0;

    for (unsigned int i = 1; i <= number; ++i) {
        square += i;
    }
    
    return square*square;
    //return pow((n * (n + 1)) / 2, 2);
}

unsigned int difference_of_squares(unsigned int number) {
    return square_of_sum(number) - sum_of_squares(number);
}