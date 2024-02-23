//
//  PyAstParser.swift
//

import Foundation
//import PythonLib
import PySwiftCore
import PyDecode
import PyEncode

extension PyPointer {
	public var string: String { .init(cString: PyUnicode_AsUTF8(self)) }
}

extension AST {
	
}



//public class Ast {
//	
//	public static let shared = Ast()
//	
//	public static let py_cls = PyImport_ImportModule("ast")!
//	
//	
//	public static let FunctionDef =  PyObject_GetAttrString(py_cls, "FunctionDef")!
//	public static let ClassDef =  PyObject_GetAttrString(py_cls, "ClassDef")!
//	
//	public static let AnnAssign =  PyObject_GetAttrString(py_cls, "AnnAssign")!
//	public static let Subscript =  PyObject_GetAttrString(py_cls, "Subscript")!
//	
//	public static let Assign =  PyObject_GetAttrString(py_cls, "Assign")!
//	public static let Module =  PyObject_GetAttrString(py_cls, "Module")!
//	public static let stmt =  PyObject_GetAttrString(py_cls, "stmt")!
//	public static let arg =  PyObject_GetAttrString(py_cls, "arg")!
//	public static let Slice =  PyObject_GetAttrString(py_cls, "Slice")!
//	public static let keyword =  PyObject_GetAttrString(py_cls, "keyword")!
//	public static let Call =  PyObject_GetAttrString(py_cls, "Call")!
//	public static let arguments =  PyObject_GetAttrString(py_cls, "arguments")!
//	public static let str = PyObject_GetAttrString(py_cls, "str")!
//	//    public static let FunctionDef =  PyObject_GetAttrString(py_cls, "FunctionDef")
//	//    public static let FunctionDef =  PyObject_GetAttrString(py_cls, "FunctionDef")
//	//    public static let FunctionDef =  PyObject_GetAttrString(py_cls, "FunctionDef")
//	public static let ImportFrom = PyObject_GetAttrString(py_cls, "ImportFrom")!
//	
//	public static let Constant =  PyObject_GetAttrString(py_cls, "Constant")!
//	
//	public static let Expr =  PyObject_GetAttrString(py_cls, "Expr")!
//	
//	public static let NamedExpr =  PyObject_GetAttrString(py_cls, "NamedExpr")!
//	
//	public static let Name =  PyObject_GetAttrString(py_cls, "Name")!
//	
//	public static let AugAssign =  PyObject_GetAttrString(py_cls, "AugAssign")!
//	
//	public static let Attribute =  PyObject_GetAttrString(py_cls, "Attribute")!
//	
//	public static let List =  PyObject_GetAttrString(py_cls, "List")!
//	
//	public static let Dict =  PyObject_GetAttrString(py_cls, "Dict")!
//	
//	public static let Tuple =  PyObject_GetAttrString(py_cls, "Tuple")!
//	
//	public static let BinOp =  PyObject_GetAttrString(py_cls, "BinOp")!
//	
//	public static let Add =  PyObject_GetAttrString(py_cls, "Add")!
//	
//	public static let Div =  PyObject_GetAttrString(py_cls, "Div ")!
//	
//	public static let Sub =  PyObject_GetAttrString(py_cls, "Sub")!
//	
//	public static let Mult =  PyObject_GetAttrString(py_cls, "Mult")!
//	
//	public static let FloorDiv =  PyObject_GetAttrString(py_cls, "FloorDiv")!
//	
//	public static let Mod =  PyObject_GetAttrString(py_cls, "Mod")!
//	
//	public static let Pow =  PyObject_GetAttrString(py_cls, "Pow")!
//	
//	public static let With =  PyObject_GetAttrString(py_cls, "With")!
//	
//	public static let WithItem =  PyObject_GetAttrString(py_cls, "withitem")!
//	
//	public static let Elipsis =  PyObject_GetAttrString(py_cls, "Elipsis")!
//	
//	public static let Pass =  PyObject_GetAttrString(py_cls, "Pass")!
//	
//	init() {
//		
//	}
//	
//	
//	
//}

public protocol Stmt: AstProtocol {
	var type: AST.StmtType { get }
}


public protocol ExprProtocol: AstProtocol {
	var type: AST.ExprType { get }
}


public protocol PyAstObject: CustomStringConvertible, PyEncodable, Codable {
	
	var name: String { get }
	
	//var type: AstType { get }
	
	//init(_ v: PythonObject)
	
	
}

public struct Is_PyInstance {
	
	public let ptr: PyPointer
	
	public static func ~=(l: PyPointer, r: Self) -> Bool {
		PyObject_IsInstance(r.ptr, l)  == 1
	}
}

extension KeyedDecodingContainer {
	public func decode(_ type: PyAstObject.Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> PyAstObject {
		fatalError()
	}
}

//
//public func handlePyAst(_ v: PyPointer) -> PyAstObject? {
//	switch Is_PyInstance(ptr: v) {
//	case Ast.Module:
//		fatalError()
//	case Ast.ClassDef:
//		fatalError()
//	case Ast.FunctionDef:
//		fatalError()
//	case Ast.Constant:
//		fatalError()
//	case Ast.Name:
//		fatalError()
//	case Ast.Expr:
//		fatalError()
//	case Ast.Assign:
//		fatalError()
//	case Ast.AnnAssign:
//		fatalError()
//	case Ast.ImportFrom:
//		fatalError()
//	case Ast.Subscript:
//		fatalError()
//	case Ast.Call:
//		fatalError()
//	case Ast.List:
//		fatalError()
//	case Ast.Tuple:
//		fatalError()
//	case Ast.Dict:
//		fatalError()
//	case Ast.With:
//		fatalError()
//	case Ast.WithItem:
//		fatalError()
//	case Ast.Pass:
//		fatalError()
////	case Ast.Module:
////		fatalError()
////	case Ast.Module:
////		fatalError()
////	case Ast.Module:
////		fatalError()
////	case Ast.Module:
////		fatalError()
////	case Ast.Module:
////		fatalError()
////	case Ast.Module:
////		fatalError()
////	case Ast.Module:
////		fatalError()
////	case Ast.Module:
////		fatalError()
//	default: fatalError()
//	}
//	
//	return nil
//}
