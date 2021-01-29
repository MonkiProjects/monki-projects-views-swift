// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "monki-projects-ios-views",
	defaultLocalization: "en",
	platforms: [
		.iOS(.v14),
		.macOS(.v11)
	],
	products: [
		.library(
			name: "MonkiProjectsViews",
			targets: ["CommonViews", "UserViews"]
		),
		.library(
			name: "MonkiProjectsCommonViews",
			targets: ["CommonViews"]
		),
		.library(
			name: "MonkiProjectsUserViews",
			targets: ["UserViews"]
		),
	],
	dependencies: [
		.package(url: "https://github.com/MonkiProjects/monki-projects-model.git", .branch("master")),
		.package(url: "https://github.com/MonkiProjects/monki-map-model.git", .branch("master")),
		.package(url: "https://github.com/kean/FetchImage", .upToNextMinor(from: "0.3.0")),
		.package(url: "https://github.com/BubiDevs/SwiftFlags.git", .upToNextMajor(from: "1.2.0")),
		.package(url: "https://github.com/lukaskubanek/LoremSwiftum.git", from: "2.2.1"),
	],
	targets: [
		// Common
		.target(
			name: "Common",
			dependencies: [
				.product(name: "MonkiProjectsModel", package: "monki-projects-model"),
				.product(name: "MonkiMapModel", package: "monki-map-model"),
				.product(name: "FetchImage", package: "FetchImage"),
				.product(name: "SwiftFlags", package: "SwiftFlags"),
				.product(name: "LoremSwiftum", package: "LoremSwiftum"),
			]
		),
		.testTarget(
			name: "CommonTests",
			dependencies: ["Common"]
		),
		// Common
		.target(
			name: "CommonViews",
			dependencies: [
				.target(name: "Common"),
			]
		),
		// Users
		.target(
			name: "UserViews",
			dependencies: [
				.target(name: "Common"),
			],
			resources: [
				.process("Resources"),
			]
		),
		.testTarget(
			name: "UserViewsTests",
			dependencies: ["UserViews"]
		),
	]
)
