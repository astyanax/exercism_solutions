#include "binary_search.h"

const int* binary_search(int value, const int *arr, size_t length) {
    if (length == 0) return NULL;
    int middle = length / 2;
    if (arr[middle] < value)
        return binary_search(value, arr + middle + 1, length - middle);
    else if(arr[middle] > value)
        return binary_search(value, arr, middle);
    else return arr + middle;
}