import PackageDescription

let package = Package(
    name: "packages-iOS",
    platforms: [
        .iOS(.v14)
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