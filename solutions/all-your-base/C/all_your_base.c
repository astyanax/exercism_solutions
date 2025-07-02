#include "all_your_base.h"

size_t rebase(int8_t digits[], int16_t input_base, int16_t output_base, size_t input_length) {

  if (input_base < 2 || output_base < 2 || input_length < 1)
    return 0;

  int sum = 0;
  for (size_t i = 0; i < input_length; i++) {
    if (digits[i] >= input_base || digits[i] < 0)
      return 0;
    sum = sum * input_base + digits[i];
  }
  if (sum == 0)
    return 1;
  size_t output_length = log(sum) / log(output_base) + 1;
  for (size_t i = output_length; i > 0; i--) {
    digits[i - 1] = sum % output_base;
    sum /= output_base;
  }

  return output_length;
}
