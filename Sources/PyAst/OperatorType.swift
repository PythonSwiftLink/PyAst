

import Foundation

public protocol AstOperator: AstProtocol {
	var type: AST.Operator.OperatorType { get }
	var __class__: AST.Operator.OperatorType { get }
}

public extension AstOperator {
	var type: AST.Operator.OperatorType { __class__ }
}

func type2Op(_ t: AST.Operator.OperatorType) -> AstOperator.Type {
	switch t {
	case .Add:
		return AST.Operator.Add.self
	case .BitAnd:
		return AST.Operator.BitAnd.self
	case .BitOr:
		return AST.Operator.BitOr.self
	case .BitXor:
		return AST.Operator.BitXor.self
	case .Div:
		return AST.Operator.Div.self
	case .FloorDiv:
		return AST.Operator.FloorDiv.self
	case .LShift:
		return AST.Operator.LShift.self
	case .Mod:
		return AST.Operator.Mod.self
	case .Mult:
		return AST.Operator.Mult.self
	case .MatMult:
		return AST.Operator.MatMult.self
	case .Pow:
		return AST.Operator.Pow.self
	case .RShift:
		return AST.Operator.RShift.self
	case .Sub:
		return AST.Operator.Sub.self
	}
	
}

extension AstOperator {
	public var name: String { "?" }
}

extension AST {
	
	
	
	public struct Operator {
		
		public enum OperatorType: String, Codable {
			case Add
			case BitAnd
			case BitOr
			case BitXor
			case Div
			case FloorDiv
			case LShift
			case Mod
			case Mult
			case MatMult
			case Pow
			case RShift
			case Sub
			
			public func encode(to encoder: Encoder) throws {
				var c = try encoder.singleValueContainer()
				try c.encode(AST.__classinfo__(__class__: .init(__name__: rawValue)).__class__)
			}
			
		}
		
		struct Add: AstOperator {
			let __class__: OperatorType = .Add
			
			var lineno: Int
			
			var col_offset: Int
			
			var end_lineno: Int?
			
			var end_col_offset: Int?
			
			var type_comment: String?
			
			public var name: String { "+" }
			
		}
		
		struct BitAnd: AstOperator {
			let __class__: OperatorType = .BitAnd
			
			var lineno: Int
			
			var col_offset: Int
			
			var end_lineno: Int?
			
			var end_col_offset: Int?
			
			var type_comment: String?
			
			public var name: String { "&" }
			
		}
		
		struct BitOr: AstOperator {
			let __class__: OperatorType = .BitOr
			
			var lineno: Int
			
			var col_offset: Int
			
			var end_lineno: Int?
			
			var end_col_offset: Int?
			
			var type_comment: String?
			
			public var name: String { "|" }
			
			enum CodingKeys: CodingKey {
				case __class__
				case lineno
				case col_offset
				case end_lineno
				case end_col_offset
				case type_comment
			}
			
			init(from decoder: Decoder) throws {
				let container: KeyedDecodingContainer<AST.Operator.BitOr.CodingKeys> = try decoder.container(keyedBy: AST.Operator.BitOr.CodingKeys.self)
				
				self.lineno = 0//try container.decode(Int.self, forKey: AST.Operator.BitOr.CodingKeys.lineno)
				self.col_offset = 0//try container.decode(Int.self, forKey: AST.Operator.BitOr.CodingKeys.col_offset)
				self.end_lineno = try container.decodeIfPresent(Int.self, forKey: AST.Operator.BitOr.CodingKeys.end_lineno)
				self.end_col_offset = try container.decodeIfPresent(Int.self, forKey: AST.Operator.BitOr.CodingKeys.end_col_offset)
				self.type_comment = try container.decodeIfPresent(String.self, forKey: AST.Operator.BitOr.CodingKeys.type_comment)
				
			}
			
			func encode(to encoder: Encoder) throws {
				var container: KeyedEncodingContainer<AST.Operator.BitOr.CodingKeys> = encoder.container(keyedBy: AST.Operator.BitOr.CodingKeys.self)
				
				try container.encode(self.__class__, forKey: AST.Operator.BitOr.CodingKeys.__class__)
				try container.encode(self.lineno, forKey: AST.Operator.BitOr.CodingKeys.lineno)
				try container.encode(self.col_offset, forKey: AST.Operator.BitOr.CodingKeys.col_offset)
				try container.encodeIfPresent(self.end_lineno, forKey: AST.Operator.BitOr.CodingKeys.end_lineno)
				try container.encodeIfPresent(self.end_col_offset, forKey: AST.Operator.BitOr.CodingKeys.end_col_offset)
				try container.encodeIfPresent(self.type_comment, forKey: AST.Operator.BitOr.CodingKeys.type_comment)
			}
			
		}
		
		struct BitXor: AstOperator {
			let __class__: OperatorType = .BitXor
			
			var lineno: Int
			
			var col_offset: Int
			
			var end_lineno: Int?
			
			var end_col_offset: Int?
			
			var type_comment: String?
			
			public var name: String { "?" }
			
		}
		
		struct Div: AstOperator {
			let __class__: OperatorType = .Add
			
			var lineno: Int
			
			var col_offset: Int
			
			var end_lineno: Int?
			
			var end_col_offset: Int?
			
			var type_comment: String?
			
		}
		
		struct FloorDiv: AstOperator {
			let __class__: OperatorType = .FloorDiv
			
			var lineno: Int
			
			var col_offset: Int
			
			var end_lineno: Int?
			
			var end_col_offset: Int?
			
			var type_comment: String?
			
		}
		
		struct LShift: AstOperator {
			let __class__: OperatorType = .LShift
			
			var lineno: Int
			
			var col_offset: Int
			
			var end_lineno: Int?
			
			var end_col_offset: Int?
			
			var type_comment: String?
			
		}
		
		struct Mod: AstOperator {
			let __class__: OperatorType = .Mod
			
			var lineno: Int
			
			var col_offset: Int
			
			var end_lineno: Int?
			
			var end_col_offset: Int?
			
			var type_comment: String?
			
		}
		
		struct Mult: AstOperator {
			let __class__: OperatorType = .Mult
			
			var lineno: Int
			
			var col_offset: Int
			
			var end_lineno: Int?
			
			var end_col_offset: Int?
			
			var type_comment: String?
			
		}
		
		struct MatMult: AstOperator {
			let __class__: OperatorType = .MatMult
			
			var lineno: Int
			
			var col_offset: Int
			
			var end_lineno: Int?
			
			var end_col_offset: Int?
			
			var type_comment: String?
			
		}
		
		struct Pow: AstOperator {
			let __class__: OperatorType = .Pow
			
			var lineno: Int
			
			var col_offset: Int
			
			var end_lineno: Int?
			
			var end_col_offset: Int?
			
			var type_comment: String?
			
		}
		
		struct RShift: AstOperator {
			let __class__: OperatorType = .RShift
			
			var lineno: Int
			
			var col_offset: Int
			
			var end_lineno: Int?
			
			var end_col_offset: Int?
			
			var type_comment: String?
			
		}
		
		struct Sub: AstOperator {
			let __class__: OperatorType = .Sub
			
			var lineno: Int
			
			var col_offset: Int
			
			var end_lineno: Int?
			
			var end_col_offset: Int?
			
			var type_comment: String?
			
		}
		
	
	}
}
