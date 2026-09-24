// zig notes
const std = @import("std");

fn greet(name: []const u8) void {
    std.debug.print("hello {s}\n", .{name});
}

pub fn main() void {
    greet("practice");

    const nums = [_]i32{1, 2, 3};
    for (nums) |n| {
        std.debug.print("{}\n", .{n * 2});
    }
}
// TODO: try allocators next
