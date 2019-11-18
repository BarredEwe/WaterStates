// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "WaterStates",
    platforms: [.iOS(.v9)],
    products: [
        .library(name: "WaterStates", targets: ["WaterStates"]),
    ],
    targets: [
        .target(name: "WaterStates", path: "WaterStates/Classes", exclude: ["Example"]),
    ]
)
