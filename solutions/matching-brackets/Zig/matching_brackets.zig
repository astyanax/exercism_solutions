const std: type = @import("std");
const mem: type = std.mem;
pub fn isBalanced(allocator: mem.Allocator, s: []const u8) !bool {
    var stack = std.ArrayList(u8).init(allocator);
    defer stack.deinit();
    for (s) |c| {
        switch (c) {
            '[' => try stack.append(']'),
            '{' => try stack.append('}'),
            '(' => try stack.append(')'),
            ']', '}', ')' => if (stack.popOrNull() != c) return false,
            else => continue,
        }
    }
    return stack.items.len == 0;
}