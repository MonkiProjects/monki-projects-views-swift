// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "monki-projects-views",
	defaultLocalization: "en",
	platforms: [
		.iOS(.v15),
	],
	products: [
		.library(
			name: "AllMonkiProjectsViews",
			targets: ["MonkiProjectsViews", "MonkiMapViews"]
		),
		.library(
			name: "MonkiProjectsViews",
			targets: ["MonkiProjectsViews"]
		),
		.library(
			name: "MonkiMapViews",
			targets: ["MonkiMapViews"]
		),
	],
	dependencies: [
		.package(
			name: "monki-projects-dto",
			url: "https://github.com/MonkiProjects/monki-projects-dto-swift",
			//.upToNextMinor(from: "0.9.0")
			.branch("0.9.0-dto")
		),
		.package(url: "https://github.com/kean/FetchImage", .upToNextMinor(from: "0.3.0")),
		.package(url: "https://github.com/BubiDevs/SwiftFlags", .upToNextMajor(from: "1.2.0")),
		.package(url: "https://github.com/lukaskubanek/LoremSwiftum", from: "2.2.1"),
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
		// Shared Monki Projects Views
		.target(
			name: "MonkiProjectsViews",
			dependencies: [
				.target(name: "Common"),
				.product(name: "MonkiProjectsDTO", package: "monki-projects-dto"),
			],
			resources: [
				.process("Users/Resources"),
				.process("SocialNetworks/Resources"),
			]
		),
		.testTarget(
			name: "MonkiProjectsViewsTests",
			dependencies: ["MonkiProjectsViews"]
		),
		// Monki Map Views
		.target(
			name: "MonkiMapViews",
			dependencies: [
				.target(name: "MonkiProjectsViews"),
				.product(name: "MonkiMapDTO", package: "monki-projects-dto"),
			],
			resources: [
				.process("Places/Resources"),
			]
		),
	]
)
