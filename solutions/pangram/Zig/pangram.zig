pub fn isPangram(str: []const u8) bool {
    var letters = [_]bool{false} ** 26;

    for (str) |c| {
        const lower = switch (c) {
            'A'...'Z' => c + 32,
            'a'...'z' => c,
            else => continue,
        };
        letters[lower - 'a'] = true;
    }

    for (letters) |seen| {
        if (!seen) return false;
    }
    return true;
}
