// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// var libraryDirectory: String?


// #if os(macOS)
//     // macOS specific code
//     #if arch(x86_64)
//         libraryDirectory = "native/x86_64-macos"
//     #elseif arch(arm64)
//         libraryDirectory = "native/aarch64-macos"
//     #endif
// #endif

// #if os(Linux)
//     #if arch(x86_64)
//         libraryDirectory = "native/x86_64-linux"
//     #elseif arch(arm64)
//         libraryDirectory = "native/aarch64-linux"
//     #endif
// #endif

// #if os(Windows)
//     #if arch(x86_64)
//         libraryDirectory = "native/x86_64-windows"
//     #elseif arch(arm64)
//         libraryDirectory = "native/aarch64-windows"
//     #endif
// #endif

// var cSettings: [PackageDescription.CSetting] = []
// var linkerSettings: [PackageDescription.LinkerSetting] = []

// if let libraryDirectory {
//     cSettings.append(.headerSearchPath("../../\(libraryDirectory)/include/"))
//     linkerSettings.append(.linkedLibrary("Cross"))
//     linkerSettings.append(.unsafeFlags(["-L../../\(libraryDirectory)/lib/"]))
// }

let package = Package(
    name: "CrossFoundation",
    products: [
        .library(
            name: "CrossFoundation",
            targets: ["CrossFoundation"]),
    ],
    targets: [
        .target(
            name: "CrossFoundation"),
        .testTarget(
            name: "CrossFoundationTests",
            dependencies: ["CrossFoundation"]
        ),
    ]
)
