// swift-tools-version:5.8
import PackageDescription

let name: String = "SwiftExtensionsPackLinux"

var packageDependencies: [Package.Dependency] = [
    .package(url: "https://github.com/nerzh/swift-extensions-pack", .upToNextMajor(from: "1.3.1")),
    .package(url: "https://github.com/apple/swift-crypto.git", .upToNextMajor(from: "2.0.0"))
]

var targetDependencies: [Target.Dependency] = [
    .product(name: "SwiftExtensionsPack", package: "swift-extensions-pack"),
    .product(name: "Crypto", package: "swift-crypto")
]

var platforms: [SupportedPlatform] = [
    .iOS(.v13),
    .macOS(.v11)
]

/// because fucking swift package manager is ...
/// I make this Library for ios13 and above
platforms = [
    .iOS(.v13),
    .macOS(.v10_15)
]

let package = Package(
    name: name,
    platforms: platforms,
    products: [
        .library(name: name, targets: [name]),
    ],
    dependencies: packageDependencies,
    targets: [
        .target(
            name: name,
            dependencies: targetDependencies
        ),
        .testTarget(
            name: "\(name)Tests", dependencies: ["SwiftExtensionsPackLinux"]
        ),
    ]
)
