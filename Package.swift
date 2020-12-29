// swift-tools-version:5.5.0

import PackageDescription

let package = Package(
    name: "Base",
    
     platforms: [
        .macOS(.v12), .iOS(.v14) 
    ],
    products: [
        .library(
            name: "Base",
            targets: ["Base"]),
    ],
    dependencies: [    
        .package(url: "https://github.com/apple/swift-algorithms", from: "1.0.0"),
        
        .package(
            url: "https://github.com/apple/swift-collections.git", 
            .upToNextMajor(from: "1.0.0") // or `.upToNextMinor
            ),
        
        // .package(url: "../../Quick/Quick", .exact("1.0.0")),
        // .package(url: "../../Quick/Nimble", .exact("1.0.0")),
        .package(url: "https://github.com/bretsko/Quick", .exact("1.0.0")),
        .package(url: "https://github.com/bretsko/Nimble", .exact("1.0.0")),

        // QuickObjCRuntime build fails on ios and mac
        // .package(url: "https://github.com/Quick/Quick", from: "3.0.0"),
        // .package(url: "https://github.com/Quick/Nimble", from: "9.0.0-rc.1"),

    ],
    targets: [

        .target(name: "Base", dependencies: [
            .product(name: "Algorithms", package: "swift-algorithms"),
            .product(name: "Collections", package: "swift-collections")
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
