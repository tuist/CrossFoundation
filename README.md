# CrossFoundation

This is a Swift Package that provides a Foundation-like API for cross-platform development.
`CrossFoundation` builds on Zig's standard library wrapping it in Swift.

## Development

### Architecture

Since SwiftPM doesn't support resolving a distributed graph that includes binaries, binaries and headers for the supported platforms are included in the Git repository under `bin/` such that they are checked out when SwiftPM clones the repository.