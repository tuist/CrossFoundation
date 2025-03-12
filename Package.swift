// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

print(#file)

var libraryDirectory: String?

#if os(macOS)
// macOS specific code
#if arch(x86_64)
libraryDirectory = "Native/x86_64-macos"
#elseif arch(arm64)
libraryDirectory = "Native/aarch64-macos"
#endif
#endif

#if os(Linux)
#if arch(x86_64)
libraryDirectory = "Native/x86_64-linux"
#elseif arch(arm64)
libraryDirectory = "Native/aarch64-linux"
#endif
#endif

#if os(Windows)
#if arch(x86_64)
libraryDirectory = "Native/x86_64-windows"
#elseif arch(arm64)
libraryDirectory = "Native/aarch64-windows"
#endif
#endif

var cSettings: [PackageDescription.CSetting] = []
var testsCSettings: [PackageDescription.CSetting] = []
var linkerSettings: [PackageDescription.LinkerSetting] = []

if let libraryDirectory {
    cSettings.append(.headerSearchPath("\(libraryDirectory)/include/"))
    linkerSettings.append(.linkedLibrary("Cross"))
    linkerSettings.append(.unsafeFlags(["-LSources/CrossFoundation/\(libraryDirectory)/lib/"]))
}

let package = Package(
    name: "CrossFoundation",
    platforms: [.macOS("14.0")],
    products: [
        .library(
            name: "CrossFoundation",
            targets: ["CrossFoundation"]),
    ],
    dependencies: [
        .package(url: "https://github.com/tuist/Path.git", .upToNextMajor(from: "0.3.8"))
    ],
    targets: [
        .target(
            name: "CrossFoundation",
            dependencies: [
                .product(name: "Path", package: "Path")
            ],
            exclude: ["Native/"],
            cSettings: cSettings,
            linkerSettings: linkerSettings),
        .testTarget(
            name: "CrossFoundationTests",
            dependencies: ["CrossFoundation"],
            cSettings: cSettings,
            linkerSettings: []),
    ]
)
