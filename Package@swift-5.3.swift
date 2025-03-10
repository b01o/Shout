// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Shout",
    products: [
        .library(name: "Shout", targets: ["Shout"]),
    ],
    dependencies: [
        .package(name: "Socket", url: "https://github.com/IBM-Swift/BlueSocket", from: "1.0.46"),
        .package(name: "CSSH", url: "https://github.com/b01o/Libssh2Prebuild", from: "1.10.0")
    ],
    targets: [
        .target(name: "Shout", dependencies: ["CSSH", "Socket"]),
        .testTarget(name: "ShoutTests", dependencies: ["Shout"]),
    ]
)
#if os(watchOS)
package.targets.removeAll(where: { $0.name == "ShoutTests"})
#endif
