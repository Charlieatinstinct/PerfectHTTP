// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

#if os(Linux)
let package = Package(
    name: "PerfectHTTP",
    products: [
        .library(name: "PerfectHTTP", targets: ["PerfectHTTP"])
    ],
    dependencies: [
        .package(url: "https://github.com/PerfectlySoft/PerfectLib.git", from: "3.0.0"),
        .package(url: "https://github.com/PerfectlySoft/Perfect-Net.git", from: "3.0.0"),
        .package(url: "https://github.com/PerfectlySoft/Perfect-LinuxBridge.git", from: "3.0.0")
    ],
     targets: [
        .target(name: "PerfectHTTP", dependencies: ["PerfectLib", .product(name: "PerfectNet", package: "Perfect-Net"), "LinuxBridge"]),
        .testTarget(name: "PerfectHTTPTests", dependencies: ["PerfectHTTP", .product(name: "PerfectNet", package: "Perfect-Net")])
  ]
)
#else
let package = Package(
    name: "PerfectHTTP",
    products: [
        .library(name: "PerfectHTTP", targets: ["PerfectHTTP"])
    ],
    dependencies: [
        .package(url: "https://github.com/PerfectlySoft/PerfectLib.git", from: "3.0.0"),
        .package(url: "https://github.com/PerfectlySoft/Perfect-Net.git", from: "3.0.0")
    ], targets: [
        .target(name: "PerfectHTTP", dependencies: ["PerfectLib", .product(name: "PerfectNet", package: "Perfect-Net")]),
        .testTarget(name: "PerfectHTTPTests", dependencies: ["PerfectHTTP", .product(name: "PerfectNet", package: "Perfect-Net")])
  ]
)
#endif
