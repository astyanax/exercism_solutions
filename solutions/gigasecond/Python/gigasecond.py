import datetime

TIMEDELTA_GIGASECOND = datetime.timedelta(seconds=10**9)

def add(moment):
    return moment + TIMEDELTA_GIGASECOND