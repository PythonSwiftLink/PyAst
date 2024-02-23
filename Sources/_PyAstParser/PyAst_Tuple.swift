

import Foundation
import PySwiftCore

public class PyAst_Tuple: PyAstObject {
    
    public var description: String { name }
    
    public let type: AstType = .Tuple
    
    public var elts: [PyAstObject]
    
    public var name: String { fatalError() }
    
    public required init(_ v: PythonObject) {
        
        elts = v.elts.compactMap(handlePyAst)

    }
    
	public var pyObject: PythonSwiftCore.PythonObject {
		fatalError()
	}
	
	public var pyPointer: PythonSwiftCore.PyPointer {
		fatalError()
	}
}
