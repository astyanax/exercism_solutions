module main

fn collatz(number int) !int {
	mut n := number
	mut steps := 0
	if n <= 0 {
		return error('zero or negative value given')
	}
    for n > 1 {
        if n % 2 == 0 {
            n /= 2   
        } else {
            n = 3 * n + 1
        }
        steps += 1
    }

    return steps
}
