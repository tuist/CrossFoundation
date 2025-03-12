//! By convention, root.zig is the root source file when making a library. If
//! you are making an executable, the convention is to delete this file and
//! start with main.zig instead.
const std = @import("std");
const testing = std.testing;

pub const FileSystemCreateDirectoryOptions = extern struct {
    createIntermediaryDirectories: bool,
};

pub export fn file_system_create_directory(path: [*:0]const u8, options: FileSystemCreateDirectoryOptions) i32 {
    const pathSlice = std.mem.sliceTo(path, 0);

    const fs = std.fs.cwd();
    if (options.createIntermediaryDirectories) {
        // Use makePath for creating intermediate directories
        fs.makePath(pathSlice) catch |err| {
            return @intFromError(err);
        };
    } else {
        // Use makeDir without the permissions parameter
        fs.makeDir(pathSlice) catch |err| {
            return @intFromError(err);
        };
    }
    return 0;
}
