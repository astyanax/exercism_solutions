pub fn primes(buffer: []u32, limit: u32) []u32 {
    if (limit < 2) return buffer[0..0];

    var count: usize = 0;

    if (limit >= 2) {
        buffer[count] = 2;
        count += 1;
    }

    var num: u32 = 3;
    while (num <= limit) : (num += 2) {
        var is_prime = true;
        var i: usize = 0;
        while (i < count and buffer[i] * buffer[i] <= num) : (i += 1) {
            if (num % buffer[i] == 0) {
                is_prime = false;
                break;
            }
        }
        if (is_prime) {
            buffer[count] = num;
            count += 1;
        }
    }

    return buffer[0..count];
}
