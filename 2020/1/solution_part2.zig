// Zig implementation of problem 1, part 2

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

fn getProductOfThreeEntries(arr: []const i32, sum: i32) i32 {
    // this time need to find the product of the 3 numbers that sum to 2020
    // requires keeping a hashmap with the following properties (key: sum of pairs, value: product of pairs)
    const n = arr.len;

    var pair_sum_map = std.AutoHashMap(i32, i32).init(test_allocator);

    // populate hashmap
    for (arr) |item| {
        for (arr) |item2| {
            var temp = item + item2;

            pair_sum_map.put(@intCast(i32, temp), item * item2) catch |err| return 0;
        }
    }

    // look for pair + item and output product
    for (arr) |item, i| {
        if (pair_sum_map.contains(sum - item)) {
            if (pair_sum_map.get(sum - item)) |pair_product| {
                return item * pair_product;
            }
        }
    }
    return 0;
}

pub fn main() void {
    print("{}\n", .{getProductOfThreeEntries(&array, 2020)});
}
