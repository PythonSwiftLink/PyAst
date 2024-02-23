//
//  File.swift
//  
//
//  Created by CodeBuilder on 10/02/2024.
//

import Foundation
import PySwiftCore
import PyCodable

public struct AST {
	public enum AstType: String, Codable {
		case Module
	}
	
	public enum StmtType: String, Codable {
		case FunctionDef
		case AsyncFunctionDef
		case ClassDef
		case Return
		case Delete
		case Assign
		case AugAssign
		case AnnAssign
		case For
		case AsyncFor
		case While
		case If
		case With
		case AsyncWith
		case Raise
		case Try
		case TryStar
		case Assert
		case Import
		case ImportFrom
		case Global
		case Nonlocal
		case Expr
		case Pass
		case Break
		case Continue
	}
	
	public enum ExprType: String, Codable {
		case BoolOp
		case BinOp
		case UnaryOp
		case Lambda
		case IfExp
		case Dict
		case Set
		case ListComp
		case SetComp
		case DictComp
		case GeneratorExp
		case Await
		case Yield
		case YieldFrom
		case Compare
		case Call
		case FormattedValue
		case JoinedStr
		case Constant
		case NamedExpr
		case Attribute
		case Slice
		case Subscript
		case Starred
		case Name
		case List
		case Tuple
		case NoneType
	}
	
	public struct __classinfo__: Decodable {
		
		let __class__: ClassName
		
		public struct ClassName: Decodable {
			let __name__: String
		}
	}
}


extension AST {
	
	
	
	final public class Module: Codable {
		
		public var description: String { name }
		
		public var type: AstType = .Module
		
		
		public var body: [Stmt]
		
		public var name: String {
			""
		}
		
		enum CodingKeys: CodingKey {
			case body
		}
		
		public init(from decoder: Decoder) throws {
			let c = try decoder.container(keyedBy: CodingKeys.self)
			body = try c.decode([Stmt].self, forKey: .body)
		}
		public func encode(to encoder: Encoder) throws {
			
		}
	}
	
}




extension SingleValueDecodingContainer {
	func decode(_ type: ExprProtocol.Type) throws -> ExprProtocol {
		fatalError()
	}
	
}

extension Decoder {
	func yourmom() {
		
	}
}
func type2Expr(_ t: AST.ExprType) -> ExprProtocol.Type {
	switch t {
	case .NoneType:
		return AST.NoneType.self
	case .BoolOp:
		fatalError(t.rawValue)
	case .BinOp:
		return AST.BinOp.self
	case .UnaryOp:
		fatalError(t.rawValue)
	case .Lambda:
		fatalError(t.rawValue)
	case .IfExp:
		fatalError(t.rawValue)
	case .Dict:
		return AST.Dict.self
	case .Set:
		fatalError(t.rawValue)
	case .ListComp:
		fatalError(t.rawValue)
	case .SetComp:
		fatalError(t.rawValue)
	case .DictComp:
		fatalError(t.rawValue)
	case .GeneratorExp:
		fatalError(t.rawValue)
	case .Await:
		fatalError(t.rawValue)
	case .Yield:
		fatalError(t.rawValue)
	case .YieldFrom:
		fatalError(t.rawValue)
	case .Compare:
		fatalError(t.rawValue)
	case .Call:
		return AST.Call.self
	case .FormattedValue:
		fatalError(t.rawValue)
	case .JoinedStr:
		fatalError(t.rawValue)
	case .Constant:
		return AST.Constant.self
	case .NamedExpr:
		fatalError(t.rawValue)
	case .Attribute:
		fatalError(t.rawValue)
	case .Slice:
		return AST.Slice.self
	case .Subscript:
		return AST.Subscript.self
	case .Starred:
		fatalError(t.rawValue)
	case .Name:
		return AST.Name.self
	case .List:
		return AST.List.self
	case .Tuple:
		return AST.Tuple.self
	}
}

extension UnkeyedDecodingContainer {
	mutating func decode(_ type: (any ExprProtocol).Type, t: AST.ExprType) throws -> (any ExprProtocol) {
		fatalError()
	}
}

extension KeyedDecodingContainer {
	
	public func decode(_ type: (any ExprProtocol).Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> (any ExprProtocol) {
		let t: AST.ExprType = try decode(AstType: key)
		return try decode(type2Expr(t), forKey: key)
	}
//	public func decode(_ type: Expr.Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> Expr {
//		fatalError()
//	}
	
}

extension KeyedDecodingContainer {
	
	func decode(AstType key: KeyedDecodingContainer<K>.Key) throws -> AST.AstType {
		let t = try decode(__class__: key)
		return .init(rawValue: t)!
	}
	func decode(AstType key: KeyedDecodingContainer<K>.Key) throws -> AST.StmtType {
		let t = try decode(__class__: key)
		
		return .init(rawValue: t)!
	}
	func decode(AstType key: KeyedDecodingContainer<K>.Key) throws -> AST.ExprType {
		let t = try decode(AST.__classinfo__.self, forKey: key).__class__.__name__
		return .init(rawValue: t)!
	}
	
	public func decodeIfPresent(_ type: [ExprProtocol].Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> [ExprProtocol]? {
		if try decodeNil(forKey: key) { return nil }
		return try decode(type, forKey: key)
	}
	
	public func decodeIfPresent(_ type: (any ExprProtocol).Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> (any ExprProtocol)? {
		if try decodeNil(forKey: key) { return nil }
		return try decode(type, forKey: key)
	}
	public func decode(_ type: Stmt.Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> Stmt {
		fatalError()
	}
	
	public func decode(_ type: [AST.AstType].Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> [AST.AstType] {
		var c = try nestedUnkeyedContainer(forKey: key)
		var out = [AST.AstType]()
		while !c.isAtEnd {
			out.append(try c.decode(AST.AstType.self))
		}
		return out
	}
	public func decode(_ type: [AST.StmtType].Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> [AST.StmtType] {
		var c = try nestedUnkeyedContainer(forKey: key)
		var out = [AST.StmtType]()
		
		while !c.isAtEnd {
			let t = try c.decode(AST.__classinfo__.self).__class__.__name__
			out.append(.init(rawValue: t)! )
		}
		return out
	}
	public func decode(_ type: [AST.ExprType].Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> [AST.ExprType] {
		var c = try nestedUnkeyedContainer(forKey: key)
		var out = [AST.ExprType]()
		while !c.isAtEnd {
			let t = try c.decode(AST.__classinfo__.self).__class__.__name__
			out.append(.init(rawValue: t)!)
		}
		return out
	}
	
	public func decode(_ type: [ExprProtocol].Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> [ExprProtocol] {
		
		var types = try decode([AST.ExprType].self, forKey: key)
		var out = [ExprProtocol]()
		var c = try nestedUnkeyedContainer(forKey: key)
		for t in types {
			out.append(try c.decode(type2Expr(t)))
		}
		return out
	}
	
	public func decode(_ type: [Stmt].Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> [Stmt] {
		var c = try nestedUnkeyedContainer(forKey: key)
		//print(self,"decode(_ type: [Stmt].Type, forKey key: \(key))")
		//print(try! decode([AST.__class__].self, forKey: key).map(\.__name__))
		
		var types = try! decode([AST.StmtType].self, forKey: key)
		var out = [Stmt]()
		for t in types {
			switch t {
			case .ClassDef:
				out.append(try c.decode(AST.ClassDef.self))
			case .FunctionDef:
				out.append(try c.decode(AST.FunctionDef.self))
			case .AnnAssign:
				out.append(try c.decode(AST.AnnAssign.self))
			case .Assign:
				out.append(try c.decode(AST.Assign.self))
				
			case .Expr:
				out.append(try c.decode(AST.Expr.self))
			case .Pass:
				out.append(try c.decode(AST.Pass.self))
				
			case .ImportFrom:
				out.append(try c.decode(AST.ImportFrom.self))
			default: fatalError(t.rawValue)
			}
		}
		return out
	}
}


extension UnkeyedDecodingContainer {
//	mutating func decode(_ type: AstType.Type) throws -> AstType {
//
//	}
}


extension PyDecoder {
	
}
