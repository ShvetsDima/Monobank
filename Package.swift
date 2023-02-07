// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "Monobank",
	platforms: [
        .macOS(.v13),
		.iOS(.v16),
		.tvOS(.v16)
	],
	products: [
		.library(name: "Monobank", targets: ["Monobank"]),
	],
	dependencies: [
		.package(url: "https://github.com/Moya/Moya", from: "15.0.3"),
		.package(url: "https://github.com/kishikawakatsumi/KeychainAccess", from: "4.2.2"),
		.package(url: "https://github.com/hyperoslo/Cache", from: "6.0.0")
	],
	targets: [
		.target(
            name: "Monobank",
            dependencies: [
                "KeychainAccess",
                .product(name: "Moya", package: "Moya"), 
                "Cache"
            ]
        ),
		.testTarget(name: "MonobankTests", dependencies: ["Monobank"])
	]
)
