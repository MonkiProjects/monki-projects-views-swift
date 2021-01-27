// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "monki-map-ios-views",
	products: [
		.library(
			name: "MonkiMapViews",
			targets: ["MonkiMapViews"]
		),
	],
	dependencies: [
		.package(url: "https://github.com/MonkiProjects/monki-projects-model.git", .branch("master")),
		.package(url: "https://github.com/MonkiProjects/monki-map-model.git", .branch("master")),
	],
	targets: [
		.target(
			name: "MonkiMapViews",
			dependencies: [
				.product(name: "MonkiProjectsModel", package: "monki-projects-model"),
				.product(name: "MonkiMapModel", package: "monki-map-model"),
			]
		),
		.testTarget(
			name: "MonkiMapViewsTests",
			dependencies: ["MonkiMapViews"]
		),
	]
)
