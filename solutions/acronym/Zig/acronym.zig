const std: type = @import("std");
const mem: type = std.mem;

pub fn abbreviate(allocator: mem.Allocator, words: []const u8) mem.Allocator.Error![]u8 {
    var result = std.ArrayList(u8).init(allocator);
    errdefer result.deinit();

    var s = std.mem.tokenize(u8, words, " _-");
    while (s.next()) |w| try result.append(w[0] & '_');
    return result.toOwnedSlice();
}
