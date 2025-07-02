#include "clock.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

clock_t clock_create(int hour, int minute) {
    clock_t clock = { "00:00" };

    while (minute < 0) {
        minute += 60;
        hour--;
    }
    
    while (hour < 0)
        hour += 24;
    
    hour = (hour + minute / 60) % 24;
    minute %= 60;
    snprintf(clock.text, MAX_STR_LEN, "%02d:%02d", hour, minute);
    return clock;
}

clock_t clock_add(clock_t clock, int minute_add) {
    int hour, min;
    sscanf(clock.text, "%02d:%02d", &hour, &min);
    return clock_create(hour, min + minute_add);
}

clock_t clock_subtract(clock_t clock, int minute_subtract) {
    return clock_add(clock, -minute_subtract);
}

bool clock_is_equal(clock_t a, clock_t b) {
    return strcmp(a.text, b.text) == 0;
}