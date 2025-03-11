const std = @import("std");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();

    const allocator = gpa.allocator();

    // Alocação na stack
    const stack_var: [100]u8 = undefined;
    _ = stack_var;

    const heap_var = try allocator.alloc(u8, 100);
    defer allocator.free(heap_var);

    std.time.sleep(2 * std.time.ns_per_s);
    std.debug.print("Memória alocada com êxito!\n", .{});
}
