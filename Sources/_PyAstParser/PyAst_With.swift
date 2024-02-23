

import Foundation
import PySwiftCore

public class PyAst_With: PyAstObject {
    
    public var description: String { name }
    
    public let type: AstType = .With
    
    public var items: [PyAstObject]
    public var body: [PyAstObject]
    
    public var name: String { items.first?.name ?? "Nil" }
    
    public required init(_ v: PythonObject) {
        
        items = v.items.compactMap(handlePyAst)
        body = v.body.compactMap(handlePyAst)

    }
    
	public var pyObject: PythonSwiftCore.PythonObject {
		fatalError()
	}
	
	public var pyPointer: PythonSwiftCore.PyPointer {
		fatalError()
	}
}

public class PyAst_WithItem: PyAstObject {
    
    public var description: String { name }
    
    public let type: AstType = .WithItem
    
    public var context_expr: PyAstObject?

    
    public var name: String { context_expr?.name ?? "Nil" }
    
    public required init(_ v: PythonObject) {
        
        context_expr = handlePyAst(v.context_expr)
        
    }
    
	public var pyObject: PythonSwiftCore.PythonObject {
		fatalError()
	}
	
	public var pyPointer: PythonSwiftCore.PyPointer {
		fatalError()
	}
}
