// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription


let package = Package(
    name: "PyAst",
    platforms: [
		.macOS(.v11),
		.iOS(.v13)
	],
    products: [
		.library(name: "PyAst", targets: ["PyAst"])
    ],
    dependencies: [],
    targets: [
		.target(name: "PyAst")
    ]
)
