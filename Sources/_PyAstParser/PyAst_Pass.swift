
import Foundation
import PySwiftCore
//import PythonLib

public class PyAst_Pass: PyAstObject {
	
	public var description: String { name }
	
	var value: String { "Pass" }
	
	
	public var name: String {
		value
	}
	
	public let type: AstType = .Pass
	
	public required init(_ v: PythonSwiftCore.PythonObject) {

	}
	
	
	
	public var pyObject: PythonSwiftCore.PythonObject {
		fatalError()
	}
	
	public var pyPointer: PythonSwiftCore.PyPointer {
		fatalError()
	}
}
