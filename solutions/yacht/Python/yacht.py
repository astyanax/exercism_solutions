CHOICE = sum
YACHT  = lambda l: 50 if len(set(l)) == 1 else 0
ONES   = lambda l: 1 * l.count(1)
TWOS   = lambda l: 2 * l.count(2)
THREES = lambda l: 3 * l.count(3)
FOURS  = lambda l: 4 * l.count(4)
FIVES  = lambda l: 5 * l.count(5)
SIXES  = lambda l: 6 * l.count(6)
FULL_HOUSE      = lambda d: sum(d) if len(set(d)) == 2 and any(d.count(x) == 3 for x in set(d)) else 0
FOUR_OF_A_KIND  = lambda d: sum(x * 4 for x in set(d) if d.count(x) > 3)
LITTLE_STRAIGHT = lambda d: 30 if sum(d) == 15 and len(set(d)) == 5 else 0
BIG_STRAIGHT    = lambda d: 30 if sum(d) == 20 and len(set(d)) == 5 else 0

def score(dice, category):
    return category(dice)