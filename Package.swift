// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "monki-projects-views",
	defaultLocalization: "en",
	platforms: [
		.iOS(.v14),
		.macOS(.v11)
	],
	products: [
		.library(
			name: "AllViews",
			targets: ["MonkiProjectsCommonViews", "MonkiProjectsUserViews", "MonkiMapViews"]
		),
		.library(
			name: "CommonViews",
			targets: ["MonkiProjectsCommonViews"]
		),
		.library(
			name: "UserViews",
			targets: ["MonkiProjectsUserViews"]
		),
		.library(
			name: "MonkiMapViews",
			targets: ["MonkiMapViews"]
		),
	],
	dependencies: [
		.package(
			name: "monki-projects-model",
			url: "https://github.com/MonkiProjects/monki-projects-model-swift.git",
			.branch("main")
		),
		.package(
			name: "monki-map-model",
			url: "https://github.com/MonkiProjects/monki-map-model-swift.git",
			.branch("main")
		),
		.package(url: "https://github.com/kean/FetchImage", .upToNextMinor(from: "0.3.0")),
		.package(url: "https://github.com/BubiDevs/SwiftFlags.git", .upToNextMajor(from: "1.2.0")),
		.package(url: "https://github.com/lukaskubanek/LoremSwiftum.git", from: "2.2.1"),
	],
	targets: [
		// Common
		.target(
			name: "Common",
			dependencies: [
				.product(name: "FetchImage", package: "FetchImage"),
				.product(name: "SwiftFlags", package: "SwiftFlags"),
				.product(name: "LoremSwiftum", package: "LoremSwiftum"),
			]
		),
		.testTarget(
			name: "CommonTests",
			dependencies: ["Common"]
		),
		// Common Views
		.target(
			name: "MonkiProjectsCommonViews",
			dependencies: [
				.target(name: "Common"),
			]
		),
		// Users
		.target(
			name: "MonkiProjectsUserViews",
			dependencies: [
				.target(name: "Common"),
				.target(name: "MonkiProjectsCommonViews"),
				.product(name: "MonkiProjectsModel", package: "monki-projects-model"),
			],
			resources: [
				.process("Resources"),
			]
		),
		.testTarget(
			name: "MonkiProjectsUserViewsTests",
			dependencies: ["MonkiProjectsUserViews"]
		),
		// Monki Map
		.target(
			name: "MonkiMapViews",
			dependencies: [
				.target(name: "MonkiProjectsUserViews"),
				.product(name: "MonkiMapModel", package: "monki-map-model"),
			],
			resources: [
				.process("Resources"),
			]
		),
	]
)
