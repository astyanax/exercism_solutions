def success_rate:
    if   . <= 4  then 1.0
    elif . <= 8  then 0.9
    elif . == 9  then 0.8
    elif . == 10 then 0.77
    else              0 
    end;

def production_rate_per_hour: . * 221 * success_rate;
def working_items_per_minute: production_rate_per_hour / 60 | floor;

.speed | (production_rate_per_hour, working_items_per_minute)