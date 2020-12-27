// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Base",
    
     platforms: [
        .macOS(.v10_15), .iOS(.v14) //, .tvOS(.v10), .watchOS(.v4)
    ],
    products: [
        .library(
            name: "Base",
            targets: ["Base"]),
    ],
    dependencies: [    
        .package(url: "https://github.com/apple/swift-algorithms", from: "0.0.1"),
        
        
        // .package(url: "../../Quick/Quick", .exact("1.0.0")),
        // .package(url: "../../Quick/Nimble", .exact("1.0.0")),
        .package(url: "https://github.com/bretsko/Quick", from: "2.2.1"),
        .package(url: "https://github.com/bretsko/Nimble", from: "8.0.5"),

        // QuickObjCRuntime build fails on ios and mac
        // .package(url: "https://github.com/Quick/Quick", from: "3.0.0"),
        // .package(url: "https://github.com/Quick/Nimble", from: "9.0.0-rc.1"),

    ],
    targets: [

        .target(name: "Base", dependencies: [
            .product(name: "Algorithms", package: "swift-algorithms"),
        ]),

        
        // .target(
        //     name: "VariantKit", // not used currently
        //     dependencies: ["Base"]),

         .testTarget(
             name: "BaseTests",
             dependencies: ["Base",
                            "Quick", "Nimble"]),
    ]
)
