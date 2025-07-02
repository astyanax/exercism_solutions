from operator import add, sub, floordiv, mul

OPS = {"plus": add, "minus": sub, "divided": floordiv, "multiplied": mul}

def answer(question):
    tokens = question.replace('by', '')[:-1].split()[2:]
    if not tokens:
        raise ValueError('syntax error')
    if len(tokens) == 1:
        return int(tokens[0])
        
    acc = 0
    for i in range(1,len(tokens),2):
        if tokens[i] not in OPS:
            if tokens[i].isdigit():
                raise ValueError('syntax error')
            raise ValueError('unknown operation')
        else:
            try:
                if acc:
                    acc = OPS[tokens[i]](acc, int(tokens[i+1]))
                else:
                    acc += OPS[tokens[i]](int(tokens[i-1]), int(tokens[i+1]))
            except:
                raise ValueError('syntax error')
    return acc