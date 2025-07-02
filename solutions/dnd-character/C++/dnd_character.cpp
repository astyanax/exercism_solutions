#include "dnd_character.h"

#include <algorithm>
#include <random>

namespace dnd_character {

int modifier(int constitution)
{
    if (constitution - 10 >= 0)
        return (constitution - 10) / 2;
    else
        return (constitution - 11) / 2;
}

std::mt19937 gen(std::random_device{}());
std::uniform_int_distribution<> distrib(1, 6);

int ability()
{
    std::vector<int> dice(4, 0);
    for (int i = 0; i < 4; i++)
        dice[i] = distrib(gen);

    std::sort(dice.begin(), dice.end());
    
    return dice[1] + dice[2] + dice[3];
}

}