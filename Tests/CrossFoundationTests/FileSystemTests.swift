import Testing
import Path

@testable import CrossFoundation

struct FileSystemTests {
    @Test func createDirectory() async throws {
        let path = try AbsolutePath(validating: "/Users/pepicrft/Downloads/foo")
        FileSystem().createDirectory(at: path)
    }
}
