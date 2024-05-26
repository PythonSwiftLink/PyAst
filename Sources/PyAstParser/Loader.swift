

import Foundation
import PyCodable
import PySwiftCore
import PythonCore
import PyAst

let ast_parser = pythonImport(from: "ast", import_name: "parse")

func astParse(_ string: String) -> PyPointer {
	var string = string
	let str: PyPointer = string.withUTF8 { utf8 in
		PyUnicode_FromKindAndData(1, utf8.baseAddress, utf8.count)
	}
	defer { str.decref() }
	if let result = PyObject_CallOneArg(ast_parser, str) {
		return result
	}
	PyErr_Print()
	fatalError()
}

public extension AST {
	static func parseFile(url: URL) throws -> Module {
		let decoder = PyDecoder()
		let ast_object = astParse(try .init(contentsOf: url))
		return try decoder.decode(Module.self, from: ast_object)
	}
	static func parseString(_ string: String) throws -> Module {
		let decoder = PyDecoder()
		let ast_object = astParse(string)
		return try decoder.decode(Module.self, from: ast_object)
	}
}
