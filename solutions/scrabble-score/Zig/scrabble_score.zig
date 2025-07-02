pub fn score(s: []const u8) u32 {
    var total: u32 = 0;
    for (s) |c| {
        const letter: u32 = switch (c) {
            'a', 'A', 'e', 'E', 'i', 'I', 'o', 'O', 'u', 'U', 'l', 'L', 'n', 'N', 'r', 'R', 's', 'S', 't', 'T' => 1,
            'd', 'D', 'g', 'G' => 2,
            'b', 'B', 'c', 'C', 'm', 'M', 'p', 'P' => 3,
            'f', 'F', 'h', 'H', 'v', 'V', 'w', 'W', 'y', 'Y' => 4,
            'k', 'K' => 5,
            'j', 'J', 'x', 'X' => 8,
            'q', 'Q', 'z', 'Z' => 10,
            else => 0,
        };
        total += letter;
    }
    return total;
}
