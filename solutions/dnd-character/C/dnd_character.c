#include "dnd_character.h"

int ability(void){
    return 10;
}
int modifier(int score){
    if((score - 10) % 2 && (score - 10) < 0)
        return (score - 10) / 2 - 1;
    return (score - 10) / 2;
}
dnd_character_t make_dnd_character(void){
     dnd_character_t a = {5, 5, 5, 5, 5, 5, 5};
    a.constitution = 5;
    a.hitpoints = modifier(a.constitution) + 10;
    return a;
}
