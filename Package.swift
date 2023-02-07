// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "Monobank",
	platforms: [
		.macOS(.v10_15),
		.iOS(.v13),
		.tvOS(.v13)
	],
	products: [
		.library(name: "Monobank", targets: ["Monobank"]),
	],
	dependencies: [
		.package(url: "https://github.com/Moya/Moya", from: "15.0.3"),
		.package(url: "https://github.com/kishikawakatsumi/KeychainAccess", from: "4.2.2"),
		.package(url: "https://github.com/ShvetsDima/SourceryPlugin", branch: "main"),
		.package(url: "https://github.com/hyperoslo/Cache", from: "6.0.0")
	],
	targets: [
		.target(name: "Monobank",
				dependencies: ["KeychainAccess", .product(name: "Moya", package: "Moya"), "Cache"],
				exclude: ["Templates/AutoUseCaseProvider.stencil"],
				plugins: [.plugin(name: "SourceryPlugin", package: "SourceryPlugin")]),
		.testTarget(name: "MonobankTests", dependencies: ["Monobank"])
	]
)
