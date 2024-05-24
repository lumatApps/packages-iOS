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
        .library(name: "LocationManager2", targets: ["LocationManager2"]),
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
        .target(
            name: "LocationManager2",
            path: "LocationManager2/Sources/LocationManager2"
        ),
        .testTarget(
            name: "LocationManagerTests2",
            dependencies: ["LocationManager2"],
            path: "LocationManager2/Tests/LocationManagerTests2"
        ),
    ]
)
