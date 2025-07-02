def rebase(input_base, digits, output_base):
    if input_base < 2:
        raise ValueError('input base must be >= 2')
    if output_base < 2:
        raise ValueError('output base must be >= 2')
    if not all(0 <= d < input_base for d in digits):
        raise ValueError('all digits must satisfy 0 <= d < input base')

    decimal = sum(d*input_base**i for i,d in enumerate(digits[::-1]))
    if decimal == 0: return [0]

    out_digits = []
    while decimal > 0:
        decimal, digit = divmod(decimal, output_base)
        out_digits.insert(0, digit)
    return out_digits