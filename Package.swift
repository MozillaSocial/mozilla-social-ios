// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MoSoContentKit",
    defaultLocalization: "en",
    platforms: [.iOS("16"), .macOS("13")],
    products: [
        .library(name: "MoSoCore", targets: ["MoSoCore"]),
        .library(name: "MoSoClient", targets: ["MoSoClient"]),
        .library(name: "DiscoverKit", targets: ["DiscoverKit"]),
        .library(name: "ReadingListKit", targets: ["ReadingListKit"]),
        .library(name: "DesignKit", targets: ["DesignKit"]),
        .library(name: "MoSoAnalytics", targets: ["MoSoAnalytics"]),
    ],
    dependencies: [
        .package(url: "https://github.com/mozilla/glean-swift", from: "54.0.0"),
        .package(url: "https://github.com/apollographql/apollo-ios.git", exact: "1.7.0"),
    ],
    targets: [
        .target(
            name: "MoSoCore"),
        .testTarget(
            name: "MoSoCoreTests",
            dependencies: ["MoSoCore"]),
        .target(
            name: "MoSoClient"),
        .testTarget(
            name: "MoSoClientTests",
            dependencies: ["MoSoClient"]),
        .target(
            name: "DiscoverKit",
            dependencies: ["MoSoCore", "MoSoClient", "DesignKit", "MoSoAnalytics"]
        ),
        .testTarget(
            name: "DiscoverKitTests",
            dependencies: ["DiscoverKit"]),
        .target(
            name: "ReadingListKit",
            dependencies: ["MoSoCore", "DesignKit", "MoSoAnalytics", .product(name: "Apollo", package: "apollo-ios")]
        ),
        .testTarget(
            name: "ReadingListKitTests",
            dependencies: ["ReadingListKit"]),
        .target(
            name: "DesignKit"),
        .testTarget(
            name: "DesignKitTests",
            dependencies: ["DesignKit"]),
        .target(
            name: "MoSoAnalytics",
            dependencies: [
                "MoSoCore",
                .product(name: "Glean", package: "glean-swift")
            ]
        ),
        .testTarget(
            name: "MoSoAnalyticsTests",
            dependencies: ["MoSoAnalytics", .product(name: "Glean", package: "glean-swift")]),
    ]
)
