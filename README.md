# CrossFoundation

[![Cross Foundation CI](https://github.com/tuist/CrossFoundation/actions/workflows/CrossFoundation.yml/badge.svg)](https://github.com/tuist/CrossFoundation/actions/workflows/CrossFoundation.yml)

This is a Swift Package that fills the cross-platform gap necessary to take Swift to new platforms.
The package uses Zig's amazing cross-platform compilation capabilities to build native binaries for the supported platforms.

> [!WARNING]
> The package is currently work in progress.

## Development

### Architecture

Since SwiftPM doesn't support resolving a distributed graph that includes binaries, binaries and headers for the supported platforms are included in the Git repository under `Sources/CrossFoundation/Native` such that they are checked out when SwiftPM clones the repository.

> [!NOTE]
> The binaries are not yet included in the repository, but you can build them locally by running `mise run build:zig`.

### Set up

1. Clone the repository: `git clone git@github.com:tuist/CrossFoundation.git`.
2. Install the dependencies: `mise install`.
3. Build the project: `mise run build`.