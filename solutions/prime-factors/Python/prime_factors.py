def factors(n):
    def proc(n):
        c = 2
        while(n > 1):
            if(n % c == 0):
                yield c
                n = n / c
            else:
                c = c + 1

    return [x for x in proc(n)]