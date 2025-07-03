const std = @import("std");
const mem = std.mem;

pub const ConversionError = error{
    InvalidInputBase,
    InvalidOutputBase,
    InvalidDigit,
};

pub fn convert(
    allocator: mem.Allocator,
    digits: []const u32,
    input_base: u32,
    output_base: u32,
) (mem.Allocator.Error || ConversionError)![]u32 {
    if (input_base < 2) return ConversionError.InvalidInputBase;

    if (output_base < 2) return ConversionError.InvalidOutputBase;

    var input_num: u32 = 0;

    if (digits.len > 0) {
        var input_mult: u32 = 1;

        for (0..digits.len) |i| {
            const digit = digits[digits.len - i - 1];
            if (digit >= input_base) return ConversionError.InvalidDigit;
            input_num += digit * input_mult;
            input_mult *= input_base;
        }
    }

    var arr = std.ArrayList(u32).init(allocator);

    defer arr.deinit();

    while (input_num > 0) {
        try arr.append(input_num % output_base);
        input_num /= output_base;
    }

    if (arr.items.len == 0) {
        try arr.append(0);
    }

    const sl = try arr.toOwnedSlice();

    if (sl.len > 1) {
        mem.reverse(u32, sl);
    }

    return sl;
}
