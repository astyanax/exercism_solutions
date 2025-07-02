def is_palindrome(x):
    return str(x) == str(x)[::-1]

def valid_input(f):
    def g(min_factor,max_factor):
        if min_factor > max_factor:
            raise ValueError("min must be <= max")
        return f(min_factor,max_factor)
    return g

@valid_input
def largest(min_factor, max_factor):
    palindrome = None, [],
    for i in range(max_factor, min_factor-1, -1):
        for j in range(i, min_factor-1, -1):
            p = i*j
            if is_palindrome(p):
                if not palindrome[0] or p > palindrome[0]:
                    palindrome = p, [[i,j]]
                elif p == palindrome[0]:
                    palindrome[1].append([i,j])
                break
    return palindrome

@valid_input
def smallest(min_factor, max_factor):
    n_min = ""
    for i in range(min_factor,max_factor+1):
        for j in range(i, max_factor+1):
            num = i*j
            if is_palindrome(num) and n_min == "":
                return num, [[i, j]]
    return (None,[])