//
//  PyAst_Assign.swift
//  PythonSwiftLink
//
//  Created by MusicMaker on 25/12/2022.
//  Copyright © 2022 Example Corporation. All rights reserved.
//

import Foundation
////import PythonLib
import PySwiftCore


public class PyAst_AnnAssign: PyAstObject {
	public var description: String { name }
	
	
	public let type: AstType = .AnnAssign
	
	public var name: String {target.name}
	
	public var target: PyAst_Name
	
	public var annotation: PyAst_Annotation
	
	required public init(_ v: PythonSwiftCore.PythonObject) {

		target = .init(v.target)
		annotation = .init(v.annotation)
	}
	
	public var pyObject: PythonSwiftCore.PythonObject {
		fatalError()
	}
	
	public var pyPointer: PythonSwiftCore.PyPointer {
		fatalError()
	}
}
