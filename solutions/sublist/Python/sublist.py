"""
This exercise stub and the test suite contain several enumerated constants.

Since Python 2 does not have the enum module, the idiomatic way to write
enumerated constants has traditionally been a NAME assigned to an arbitrary,
but unique value. An integer is traditionally used because it’s memory
efficient.
It is a common practice to export both constants and functions that work with
those constants (ex. the constants in the os, subprocess and re modules).

You can learn more here: https://en.wikipedia.org/wiki/Enumerated_type
"""

SUBLIST = 'list_one is a sublist of list_two'
SUPERLIST = 'list_one is a superlist of list_two'
EQUAL = 'Both lists are equal'
UNEQUAL = 'The two lists are not equal'


def sublist(l1, l2):
    if l1 == l2:
        return EQUAL

    if not l1 or (len(l1) < len(l2) and any([l1 == l2[i:i + len(l1)] for i in range(len(l2) - len(l1) + 1)])):
        return SUBLIST

    if not l2 or (len(l2) < len(l1) and any([l2 == l1[i:i + len(l2)] for i in range(len(l1) - len(l2) + 1)])):
        return SUPERLIST

    return UNEQUAL