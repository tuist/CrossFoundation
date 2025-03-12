import Testing
@testable import CrossFoundation

struct FileSystemTests {
    @Test func add() {
        #expect(FileSystem().add(lhs: 3, rhs: 2) == 5)
    }
}
