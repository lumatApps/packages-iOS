// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "packages-iOS",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(name: "LocationManager", targets: ["LocationManager"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "LocationManager",
            path: "LocationManager/Sources/LocationManager"
        ),
        .testTarget(
            name: "LocationManagerTests",
            dependencies: ["LocationManager"],
            path: "LocationManager/Tests/LocationManagerTests"
        ),
    ]
)