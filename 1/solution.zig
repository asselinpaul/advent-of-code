// Zig implementation of problem 1
// should be O(n)
const std = @import("std");
const print = @import("std").debug.print;
const test_allocator = std.testing.allocator;

const array = [_]i32{
    1721,
    979,
    366,
    299,
    675,
    1456,
};

fn getPairProduct(arr: []const i32, sum: i32) i32 {
    const n = arr.len;

    var map = std.AutoHashMap(i32, i32).init(test_allocator);

    for (arr) |item, i| {
        var temp = sum - item;

        if (map.contains(temp)) {
            return (temp * (sum - temp));
        }

        map.put(@intCast(i32, item), 1) catch |err| return 0;
    }
    return 0;
}

pub fn main() void {
    print("{}\n", .{getPairProduct(&array, 2020)});
}
