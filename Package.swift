// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "Base",
    
    platforms: [
        .macOS(.v12), .iOS(.v15)
        
    ],
    products: [
        .library(
            name: "Base",
            targets: ["Base"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-algorithms", from: "1.0.0"),
        
        .package(
            url: "https://github.com/apple/swift-collections.git", from: "1.0.0"),
        
        // .package(url: "../../Quick/Quick", from: "1.0.0"),
        // .package(url: "../../Quick/Nimble", from: "1.0.0"),
        
        // QuickObjCRuntime build fails on ios and mac
        //        .package(url: "https://github.com/Quick/Quick", from: "5.0.0"),
        //        .package(url: "https://github.com/Quick/Nimble", from: "10.0.0"),
        
    ],
    targets: [
        
        .target(
            name: "Base",
            dependencies: [
                .product(name: "Algorithms", package: "swift-algorithms"),
                .product(name: "Collections", package: "swift-collections")
            ]
            // currently Packages with unsafe flags cannot be depended on
            //https://stackoverflow.com/questions/66462498/how-to-override-the-unsafeflags-behavior-of-swift-package-manager
            //swiftSettings: [.unsafeFlags(["-suppress-warnings"])]
        ),
        
        // .target(
        //     name: "VariantKit", // not used currently
        //     dependencies: ["Base"]),
        
            // .testTarget(
            //     name: "BaseTests",
            //     dependencies: [
            //     "Base",
            //     .product(name: "Quick", package: "Quick"),
            //     .product(name: "NimbleLib", package: "Quick")
            //     ]
            //     ),
    ]
)
