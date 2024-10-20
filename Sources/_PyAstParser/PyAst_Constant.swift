//
//  File.swift
//  
//
//  Created by MusicMaker on 28/12/2022.
//

import Foundation
import PySwiftCore
//import PythonLib

public class PyAst_Constant: PyAstObject {
    
    public var description: String { name }
    
    var value: String
    
    
    public var name: String {
        value
    }
    
    public let type: AstType = .Constant
    
    public required init(_ v: PythonSwiftCore.PythonObject) {
        
        let _value = v.value.ptr
		switch _value {
		case pyBool_Type:
			value = _value == PyTrue ? "true": "false"
		case pyUnicode_Type:
			value = _value.string
		case pyLong_Type:
			value = "\(try! Int(object: _value.pyPointer))"
		case pyNone_Type:
			value = "None"
		default:
	
			value = "nil"
		}
//        switch _value {
//            
//        case let _bool where PyBool_Check(_value):
//            value = _bool == PyTrue ? "true": "false"
//        case let _str where PyUnicode_Check(_value):
//            value = _str.string
//		case let _int where PyLong_Check(_value):
//			value = "\(try! Int(object: _int.pyPointer))"
//        case let _none where _none == PyNone:
//            value = "None"
//        default:
//            value = "nil"
//        }
        
    }
    
    
    
	public var pyObject: PythonSwiftCore.PythonObject {
		fatalError()
	}
	
	public var pyPointer: PythonSwiftCore.PyPointer {
		fatalError()
	}
}
