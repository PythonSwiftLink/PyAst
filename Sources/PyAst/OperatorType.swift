

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
		
		public struct Add: AstOperator {
			public let __class__: OperatorType = .Add
			
			public var lineno: Int
			
			public var col_offset: Int
			
			public var end_lineno: Int?
			
			public var end_col_offset: Int?
			
			public var type_comment: String?
			
			public var name: String { "+" }
			
		}
		
		struct BitAnd: AstOperator {
			public let __class__: OperatorType = .BitAnd
			
			public var lineno: Int
			
			public var col_offset: Int
			
			public var end_lineno: Int?
			
			public var end_col_offset: Int?
			
			public var type_comment: String?
			
			public var name: String { "&" }
			
		}
		
		public struct BitOr: AstOperator {
			public init(lineno: Int = 0, col_offset: Int = 0, end_lineno: Int? = nil, end_col_offset: Int? = nil, type_comment: String? = nil) {
				self.lineno = lineno
				self.col_offset = col_offset
				self.end_lineno = end_lineno
				self.end_col_offset = end_col_offset
				self.type_comment = type_comment
			}
			
			public let __class__: OperatorType = .BitOr
			
			public var lineno: Int
			
			public var col_offset: Int
			
			public var end_lineno: Int?
			
			public var end_col_offset: Int?
			
			public var type_comment: String?
			
			public var name: String { "|" }
			
			enum CodingKeys: CodingKey {
				case __class__
				case lineno
				case col_offset
				case end_lineno
				case end_col_offset
				case type_comment
			}
			
			public init(from decoder: Decoder) throws {
				let container: KeyedDecodingContainer<AST.Operator.BitOr.CodingKeys> = try decoder.container(keyedBy: AST.Operator.BitOr.CodingKeys.self)
				
				self.lineno = 0//try container.decode(Int.self, forKey: AST.Operator.BitOr.CodingKeys.lineno)
				self.col_offset = 0//try container.decode(Int.self, forKey: AST.Operator.BitOr.CodingKeys.col_offset)
				self.end_lineno = try container.decodeIfPresent(Int.self, forKey: AST.Operator.BitOr.CodingKeys.end_lineno)
				self.end_col_offset = try container.decodeIfPresent(Int.self, forKey: AST.Operator.BitOr.CodingKeys.end_col_offset)
				self.type_comment = try container.decodeIfPresent(String.self, forKey: AST.Operator.BitOr.CodingKeys.type_comment)
				
			}
			
			public func encode(to encoder: Encoder) throws {
				var container: KeyedEncodingContainer<AST.Operator.BitOr.CodingKeys> = encoder.container(keyedBy: AST.Operator.BitOr.CodingKeys.self)
				
				try container.encode(self.__class__, forKey: AST.Operator.BitOr.CodingKeys.__class__)
				try container.encode(self.lineno, forKey: AST.Operator.BitOr.CodingKeys.lineno)
				try container.encode(self.col_offset, forKey: AST.Operator.BitOr.CodingKeys.col_offset)
				try container.encodeIfPresent(self.end_lineno, forKey: AST.Operator.BitOr.CodingKeys.end_lineno)
				try container.encodeIfPresent(self.end_col_offset, forKey: AST.Operator.BitOr.CodingKeys.end_col_offset)
				try container.encodeIfPresent(self.type_comment, forKey: AST.Operator.BitOr.CodingKeys.type_comment)
			}
			
		}
		
		public struct BitXor: AstOperator {
			public var __class__: OperatorType = .BitXor
			
			public var lineno: Int
			
			public var col_offset: Int
			
			public var end_lineno: Int?
			
			public var end_col_offset: Int?
			
			public var type_comment: String?
			
			public var name: String { "?" }
			
		}
		
		public struct Div: AstOperator {
			public var __class__: OperatorType = .Add
			
			public var lineno: Int
			
			public var col_offset: Int
			
			public var end_lineno: Int?
			
			public var end_col_offset: Int?
			
			public var type_comment: String?
			
		}
		
		public struct FloorDiv: AstOperator {
			public var __class__: OperatorType = .FloorDiv
			
			public var lineno: Int
			
			public var col_offset: Int
			
			public var end_lineno: Int?
			
			public var end_col_offset: Int?
			
			public var type_comment: String?
			
		}
		
		public struct LShift: AstOperator {
			public let __class__: OperatorType = .LShift
			
			public var lineno: Int
			
			public var col_offset: Int
			
			public var end_lineno: Int?
			
			public var end_col_offset: Int?
			
			public var type_comment: String?
			
		}
		
		public struct Mod: AstOperator {
			public let __class__: OperatorType = .Mod
			
			public var lineno: Int
			
			public var col_offset: Int
			
			public var end_lineno: Int?
			
			public var end_col_offset: Int?
			
			public var type_comment: String?
			
		}
		
		public struct Mult: AstOperator {
			public let __class__: OperatorType = .Mult
			
			public var lineno: Int
			
			public var col_offset: Int
			
			public var end_lineno: Int?
			
			public var end_col_offset: Int?
			
			public var type_comment: String?
			
		}
		
		public struct MatMult: AstOperator {
			public let __class__: OperatorType = .MatMult
			
			public var lineno: Int
			
			public var col_offset: Int
			
			public var end_lineno: Int?
			
			public var end_col_offset: Int?
			
			public var type_comment: String?
			
		}
		
		public struct Pow: AstOperator {
			public let __class__: OperatorType = .Pow
			
			public var lineno: Int
			
			public var col_offset: Int
			
			public var end_lineno: Int?
			
			public var end_col_offset: Int?
			
			public var type_comment: String?
			
		}
		
		public struct RShift: AstOperator {
			public let __class__: OperatorType = .RShift
			
			public var lineno: Int
			
			public var col_offset: Int
			
			public var end_lineno: Int?
			
			public var end_col_offset: Int?
			
			public var type_comment: String?
			
		}
		
		public struct Sub: AstOperator {
			public let __class__: OperatorType = .Sub
			
			public var lineno: Int
			
			public var col_offset: Int
			
			public var end_lineno: Int?
			
			public var end_col_offset: Int?
			
			public var type_comment: String?
			
		}
		
	
	}
}
