// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "CapacitorMetaSdk",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "CapacitorMetaSdk",
            targets: ["CapacitorMetaSdkPlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", from: "7.0.0")
    ],
    targets: [
        .target(
            name: "CapacitorMetaSdkPlugin",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm")
            ],
            path: "ios/Sources/CapacitorMetaSdkPlugin"),
        .testTarget(
            name: "CapacitorMetaSdkPluginTests",
            dependencies: ["CapacitorMetaSdkPlugin"],
            path: "ios/Tests/CapacitorMetaSdkPluginTests")
    ]
)