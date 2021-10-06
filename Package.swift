// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Estilo",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Estilo",
            targets: ["Estilo"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(name: "SnapKit", url: "https://github.com/SnapKit/SnapKit.git", .upToNextMajor(from: "5.0.1")),
        .package(name: "Nimble", url: "https://github.com/Quick/Nimble.git", .upToNextMajor(from: "9.2.1")),
        .package(name: "Quick", url: "https://github.com/Quick/Quick.git", .upToNextMajor(from: "4.0.0"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Estilo",
            dependencies: [
                .productItem(name: "SnapKit", package: "SnapKit", condition: nil)
            ]),
        .testTarget(
            name: "EstiloTests",
            dependencies: [
                .byName(name: "Estilo", condition: nil),
                .productItem(name: "Nimble", package: "Nimble", condition: nil),
                .productItem(name: "Quick", package: "Quick", condition: nil)
            ])
    ]
)
