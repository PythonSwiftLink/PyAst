// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let development = true
let local = false

var psl_string: String {
	if development { return "PythonSwiftLink-development" }
	return "PythonSwiftLink"
}

var packages: [Package.Dependency] = [
	//.package(path: "../PyCodable"),
	.package(url: "https://github.com/PythonSwiftLink/PyCodable", branch: "master")
	//.package(path: "../PythonTestSuite")
]
if local {
	packages.append(.package(path: "../\(psl_string)"))
} else {
	if development {
		packages.append(
			.package(url: "https://github.com/PythonSwiftLink/\(psl_string)",branch: "master")
		)
	} else {
		packages.append(
			.package(url: "https://github.com/PythonSwiftLink/\(psl_string)",from: .init(311, 0, 0))
		)
	}
	
}

let package = Package(
    name: "PyAst",
    platforms: [
		.macOS(.v11),
		.iOS(.v13)
	],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "PyAstParser",
            targets: ["PyAstParser"]),
		.library(name: "PyAst", targets: ["PyAst"])
//		.library(
//			name: "PyAstBuilder",
//			type: .static,
//			targets: ["PyAstBuilder"]
//		)
    ],
    dependencies: packages,
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "PyAstParser",
            dependencies: [
				"PyAst",
				.product(name: "PySwiftCore", package: psl_string),
				.product(name: "PyEncode", package: psl_string),
				.product(name: "PyDecode", package: psl_string),
				.product(name: "PyCollection", package: psl_string),
				.product(name: "PyCodable", package: "PyCodable")
				//.product(name: "SwiftSyntax", package: "swift-syntax"),
				
			]),
		.target(name: "PyAst")
//		.target(
//			name: "PyAstBuilder",
//			dependencies: [
//				//.product(name: "SwiftSyntax"),
//				.product(name: "SwiftSyntax", package: "swift-syntax"),
//				.product(name: "SwiftSyntaxBuilder", package: "swift-syntax"),
//				.product(name: "PythonSwiftCore", package: "PythonSwiftLink"),
//				"PyAstParser",
//				//"swift-syntax"
//				//.product(name: "SwiftSyntax", package: "SwiftParser")
//			]),
//        .testTarget(
//            name: "PyAstParserTests",
//            dependencies: [
//				"PyAstParser",
//				"PyAstBuilder",
//				"PythonTestSuite"
//			]),
    ]
)
