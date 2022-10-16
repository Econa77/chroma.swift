// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "chroma",
    platforms: [
        .macOS(.v10_10), .iOS(.v9)
    ],
    products: [
        .library(name: "chroma", targets: ["chroma"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "chroma", 
            dependencies: [],
            path: "Sources"
        ),
         .testTarget(
            name: "chromaTests",
            dependencies: ["chroma"],
            path: "Tests"
        ),
    ],
    swiftLanguageVersions: [.v5]
)