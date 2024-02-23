import Foundation


extension AST {
	
	public enum Operator: String, Codable {
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
		
		
		
	}
	
	public struct BoolOp: ExprProtocol {
		public var lineno: Int
		public var col_offset: Int
		public var end_lineno: Int?
		public var end_col_offset: Int?
		public var type_comment: String?
		
		public var type: AST.ExprType = .BoolOp
		
		public var op: Operator
		public var values: [ExprProtocol]
		
		public var description: String
		
		enum CodingKeys: CodingKey {
			case arg
			case value
			
			case lineno
			case col_offset
			case end_lineno
			case end_col_offset
			case type_comment
		}
		
		public init(from decoder: Decoder) throws {
			let c: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
			
			lineno = try c.decode(Int.self, forKey: .lineno)
			col_offset = try c.decode(Int.self, forKey: .col_offset)
			end_lineno = try c.decodeIfPresent(Int.self, forKey: .end_lineno)
			end_col_offset = try c.decodeIfPresent(Int.self, forKey: .end_col_offset)
			type_comment = try c.decodeIfPresent(String.self, forKey: .type_comment)
			fatalError("decoding of \(Self.self) is missing")
		}
		
		public func encode(to encoder: Encoder) throws {
			
			var container = encoder.container(keyedBy: CodingKeys.self)
			
			try container.encode(self.lineno, forKey: .lineno)
			try container.encode(self.end_lineno, forKey: .end_lineno)
			try container.encode(self.col_offset, forKey: .col_offset)
			try container.encode(self.end_col_offset, forKey: .end_col_offset)
			fatalError("encoding of \(Self.self) is missing")
		}
	}
	
	public struct BinOp: ExprProtocol {
		public var lineno: Int
		public var col_offset: Int
		public var end_lineno: Int?
		public var end_col_offset: Int?
		public var type_comment: String?
		
		public var left: ExprProtocol
		var op: Operator
		public var right: ExprProtocol
		
		//public var description: String
		
		public let type: AST.ExprType = .BinOp
		
		enum CodingKeys: CodingKey {
			case left
			case op
			case right
			
			case lineno
			case col_offset
			case end_lineno
			case end_col_offset
			case type_comment
		}
		
		public init(from decoder: Decoder) throws {
			
			let c: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
			left = try c.decode(ExprProtocol.self, forKey: .left)
			op = .init(rawValue: try c.decode(__class__: .op)) ?? .BitOr
			right = try c.decode(ExprProtocol.self, forKey: .right)
			
			lineno = try c.decode(Int.self, forKey: .lineno)
			col_offset = try c.decode(Int.self, forKey: .col_offset)
			end_lineno = try c.decodeIfPresent(Int.self, forKey: .end_lineno)
			end_col_offset = try c.decodeIfPresent(Int.self, forKey: .end_col_offset)
			type_comment = try c.decodeIfPresent(String.self, forKey: .type_comment)
			//fatalError("decoding of \(Self.self) is missing")
		}
		
		public func encode(to encoder: Encoder) throws {
			
			var container = encoder.container(keyedBy: CodingKeys.self)
			
			try container.encode(self.lineno, forKey: .lineno)
			try container.encode(self.end_lineno, forKey: .end_lineno)
			try container.encode(self.col_offset, forKey: .col_offset)
			try container.encode(self.end_col_offset, forKey: .end_col_offset)
			fatalError("encoding of \(Self.self) is missing")
		}
	}
	
	public struct UnaryOp: ExprProtocol {
		public var type: AST.ExprType = .UnaryOp
		
		public var lineno: Int
		public var col_offset: Int
		public var end_lineno: Int?
		public var end_col_offset: Int?
		public var type_comment: String?
		
		//var op: UnaryOp
		public var operand: ExprProtocol
		
		public var description: String
		
		enum CodingKeys: CodingKey {
			case arg
			case value
			
			case lineno
			case col_offset
			case end_lineno
			case end_col_offset
			case type_comment
		}
		
		public init(from decoder: Decoder) throws {
			let c: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
			
			lineno = try c.decode(Int.self, forKey: .lineno)
			col_offset = try c.decode(Int.self, forKey: .col_offset)
			end_lineno = try c.decodeIfPresent(Int.self, forKey: .end_lineno)
			end_col_offset = try c.decodeIfPresent(Int.self, forKey: .end_col_offset)
			type_comment = try c.decodeIfPresent(String.self, forKey: .type_comment)
			fatalError("decoding of \(Self.self) is missing")
		}
		
		public func encode(to encoder: Encoder) throws {
			
			var container = encoder.container(keyedBy: CodingKeys.self)
			
			try container.encode(self.lineno, forKey: .lineno)
			try container.encode(self.end_lineno, forKey: .end_lineno)
			try container.encode(self.col_offset, forKey: .col_offset)
			try container.encode(self.end_col_offset, forKey: .end_col_offset)
			fatalError("encoding of \(Self.self) is missing")
		}
	}
	
	public struct Lambda: ExprProtocol {
		public var type: AST.ExprType = .Lambda
		public var lineno: Int
		public var col_offset: Int
		public var end_lineno: Int?
		public var end_col_offset: Int?
		public var type_comment: String?
		
		public var args: Arguments
		public var body: ExprProtocol
		
		public var description: String
		
		enum CodingKeys: CodingKey {
			case arg
			case value
			
			case lineno
			case col_offset
			case end_lineno
			case end_col_offset
			case type_comment
		}
		
		public init(from decoder: Decoder) throws {
			let c: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
			
			lineno = try c.decode(Int.self, forKey: .lineno)
			col_offset = try c.decode(Int.self, forKey: .col_offset)
			end_lineno = try c.decodeIfPresent(Int.self, forKey: .end_lineno)
			end_col_offset = try c.decodeIfPresent(Int.self, forKey: .end_col_offset)
			type_comment = try c.decodeIfPresent(String.self, forKey: .type_comment)
			fatalError("decoding of \(Self.self) is missing")
		}
		
		public func encode(to encoder: Encoder) throws {
			
			var container = encoder.container(keyedBy: CodingKeys.self)
			
			try container.encode(self.lineno, forKey: .lineno)
			try container.encode(self.end_lineno, forKey: .end_lineno)
			try container.encode(self.col_offset, forKey: .col_offset)
			try container.encode(self.end_col_offset, forKey: .end_col_offset)
			fatalError("encoding of \(Self.self) is missing")
		}
	}
	
	public struct IfExp: ExprProtocol {
		public var type: AST.ExprType = .IfExp
		public var lineno: Int
		public var col_offset: Int
		public var end_lineno: Int?
		public var end_col_offset: Int?
		public var type_comment: String?
		
		public var test: ExprProtocol
		public var body: ExprProtocol
		public var orelse: ExprProtocol
		
		public var description: String
		
		enum CodingKeys: CodingKey {
			case arg
			case value
			
			case lineno
			case col_offset
			case end_lineno
			case end_col_offset
			case type_comment
		}
		
		public init(from decoder: Decoder) throws {
			let c: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
			
			lineno = try c.decode(Int.self, forKey: .lineno)
			col_offset = try c.decode(Int.self, forKey: .col_offset)
			end_lineno = try c.decodeIfPresent(Int.self, forKey: .end_lineno)
			end_col_offset = try c.decodeIfPresent(Int.self, forKey: .end_col_offset)
			type_comment = try c.decodeIfPresent(String.self, forKey: .type_comment)
			fatalError("decoding of \(Self.self) is missing")
		}
		
		public func encode(to encoder: Encoder) throws {
			
			var container = encoder.container(keyedBy: CodingKeys.self)
			
			try container.encode(self.lineno, forKey: .lineno)
			try container.encode(self.end_lineno, forKey: .end_lineno)
			try container.encode(self.col_offset, forKey: .col_offset)
			try container.encode(self.end_col_offset, forKey: .end_col_offset)
			fatalError("encoding of \(Self.self) is missing")
		}
	}
	
	public struct Dict: ExprProtocol {
		public var type: AST.ExprType = .Dict
		public var lineno: Int
		public var col_offset: Int
		public var end_lineno: Int?
		public var end_col_offset: Int?
		public var type_comment: String?
		
		public var keys: [ExprProtocol?]
		public var values: [ExprProtocol]
		
		//public var description: String
		
		enum CodingKeys: CodingKey {
			case keys
			case values
			
			case lineno
			case col_offset
			case end_lineno
			case end_col_offset
			case type_comment
		}
		
		public init(from decoder: Decoder) throws {
			let c: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
			keys = try c.decode([ExprProtocol].self, forKey: .keys)
			values = try c.decode([ExprProtocol].self, forKey: .values)
			lineno = try c.decode(Int.self, forKey: .lineno)
			col_offset = try c.decode(Int.self, forKey: .col_offset)
			end_lineno = try c.decodeIfPresent(Int.self, forKey: .end_lineno)
			end_col_offset = try c.decodeIfPresent(Int.self, forKey: .end_col_offset)
			type_comment = try c.decodeIfPresent(String.self, forKey: .type_comment)
			//fatalError("decoding of \(Self.self) is missing")
		}
		
		public func encode(to encoder: Encoder) throws {
			
			var container = encoder.container(keyedBy: CodingKeys.self)
			
			try container.encode(self.lineno, forKey: .lineno)
			try container.encode(self.end_lineno, forKey: .end_lineno)
			try container.encode(self.col_offset, forKey: .col_offset)
			try container.encode(self.end_col_offset, forKey: .end_col_offset)
			fatalError("encoding of \(Self.self) is missing")
		}
	}
	
	public struct Set: ExprProtocol {
		public var type: AST.ExprType = .Set
		public var lineno: Int
		public var col_offset: Int
		public var end_lineno: Int?
		public var end_col_offset: Int?
		public var type_comment: String?
		
		public var elts: [ExprProtocol]
		
		public var description: String
		
		enum CodingKeys: CodingKey {
			case arg
			case value
			
			case lineno
			case col_offset
			case end_lineno
			case end_col_offset
			case type_comment
		}
		
		public init(from decoder: Decoder) throws {
			let c: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
			
			lineno = try c.decode(Int.self, forKey: .lineno)
			col_offset = try c.decode(Int.self, forKey: .col_offset)
			end_lineno = try c.decodeIfPresent(Int.self, forKey: .end_lineno)
			end_col_offset = try c.decodeIfPresent(Int.self, forKey: .end_col_offset)
			type_comment = try c.decodeIfPresent(String.self, forKey: .type_comment)
			fatalError("decoding of \(Self.self) is missing")
		}
		
		public func encode(to encoder: Encoder) throws {
			
			var container = encoder.container(keyedBy: CodingKeys.self)
			
			try container.encode(self.lineno, forKey: .lineno)
			try container.encode(self.end_lineno, forKey: .end_lineno)
			try container.encode(self.col_offset, forKey: .col_offset)
			try container.encode(self.end_col_offset, forKey: .end_col_offset)
			fatalError("encoding of \(Self.self) is missing")
		}
	}
	
	
	
	public struct ListComp: ExprProtocol {
		public var type: AST.ExprType = .ListComp
		public var lineno: Int
		public var col_offset: Int
		public var end_lineno: Int?
		public var end_col_offset: Int?
		public var type_comment: String?
		
		public var elt: ExprProtocol
		public var generators: [Comprehension]
		
		public var description: String
		
		enum CodingKeys: CodingKey {
			case arg
			case value
			
			case lineno
			case col_offset
			case end_lineno
			case end_col_offset
			case type_comment
		}
		
		public init(from decoder: Decoder) throws {
			let c: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
			
			lineno = try c.decode(Int.self, forKey: .lineno)
			col_offset = try c.decode(Int.self, forKey: .col_offset)
			end_lineno = try c.decodeIfPresent(Int.self, forKey: .end_lineno)
			end_col_offset = try c.decodeIfPresent(Int.self, forKey: .end_col_offset)
			type_comment = try c.decodeIfPresent(String.self, forKey: .type_comment)
			fatalError("decoding of \(Self.self) is missing")
		}
		
		public func encode(to encoder: Encoder) throws {
			
			var container = encoder.container(keyedBy: CodingKeys.self)
			
			try container.encode(self.lineno, forKey: .lineno)
			try container.encode(self.end_lineno, forKey: .end_lineno)
			try container.encode(self.col_offset, forKey: .col_offset)
			try container.encode(self.end_col_offset, forKey: .end_col_offset)
			fatalError("encoding of \(Self.self) is missing")
		}
	}
	
	public struct SetComp: ExprProtocol {
		public var type: AST.ExprType = .SetComp
		public var lineno: Int
		public var col_offset: Int
		public var end_lineno: Int?
		public var end_col_offset: Int?
		public var type_comment: String?
		
		public var elt: ExprProtocol
		public var generators: [Comprehension]
		
		public var description: String
		
		enum CodingKeys: CodingKey {
			case arg
			case value
			
			case lineno
			case col_offset
			case end_lineno
			case end_col_offset
			case type_comment
		}
		
		public init(from decoder: Decoder) throws {
			let c: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
			
			lineno = try c.decode(Int.self, forKey: .lineno)
			col_offset = try c.decode(Int.self, forKey: .col_offset)
			end_lineno = try c.decodeIfPresent(Int.self, forKey: .end_lineno)
			end_col_offset = try c.decodeIfPresent(Int.self, forKey: .end_col_offset)
			type_comment = try c.decodeIfPresent(String.self, forKey: .type_comment)
			fatalError("decoding of \(Self.self) is missing")
		}
		
		public func encode(to encoder: Encoder) throws {
			
			var container = encoder.container(keyedBy: CodingKeys.self)
			
			try container.encode(self.lineno, forKey: .lineno)
			try container.encode(self.end_lineno, forKey: .end_lineno)
			try container.encode(self.col_offset, forKey: .col_offset)
			try container.encode(self.end_col_offset, forKey: .end_col_offset)
			fatalError("encoding of \(Self.self) is missing")
		}
	}
	
	public struct DictComp: ExprProtocol {
		public var type: AST.ExprType = .DictComp
		public var lineno: Int
		public var col_offset: Int
		public var end_lineno: Int?
		public var end_col_offset: Int?
		public var type_comment: String?
		
		public var key: ExprProtocol
		public var value: ExprProtocol
		public var generators: [Comprehension]
		
		public var description: String
		
		enum CodingKeys: CodingKey {
			case arg
			case value
			
			case lineno
			case col_offset
			case end_lineno
			case end_col_offset
			case type_comment
		}
		
		public init(from decoder: Decoder) throws {
			let c: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
			
			lineno = try c.decode(Int.self, forKey: .lineno)
			col_offset = try c.decode(Int.self, forKey: .col_offset)
			end_lineno = try c.decodeIfPresent(Int.self, forKey: .end_lineno)
			end_col_offset = try c.decodeIfPresent(Int.self, forKey: .end_col_offset)
			type_comment = try c.decodeIfPresent(String.self, forKey: .type_comment)
			fatalError("decoding of \(Self.self) is missing")
		}
		
		public func encode(to encoder: Encoder) throws {
			
			var container = encoder.container(keyedBy: CodingKeys.self)
			
			try container.encode(self.lineno, forKey: .lineno)
			try container.encode(self.end_lineno, forKey: .end_lineno)
			try container.encode(self.col_offset, forKey: .col_offset)
			try container.encode(self.end_col_offset, forKey: .end_col_offset)
			fatalError("encoding of \(Self.self) is missing")
		}
	}
	
	public struct GeneratorExp: ExprProtocol {
		public var type: AST.ExprType = .GeneratorExp
		public var lineno: Int
		public var col_offset: Int
		public var end_lineno: Int?
		public var end_col_offset: Int?
		public var type_comment: String?
		
		public var elt: ExprProtocol
		public var generators: [Comprehension]
		
		public var description: String
		
		enum CodingKeys: CodingKey {
			case arg
			case value
			
			case lineno
			case col_offset
			case end_lineno
			case end_col_offset
			case type_comment
		}
		
		public init(from decoder: Decoder) throws {
			let c: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
			
			lineno = try c.decode(Int.self, forKey: .lineno)
			col_offset = try c.decode(Int.self, forKey: .col_offset)
			end_lineno = try c.decodeIfPresent(Int.self, forKey: .end_lineno)
			end_col_offset = try c.decodeIfPresent(Int.self, forKey: .end_col_offset)
			type_comment = try c.decodeIfPresent(String.self, forKey: .type_comment)
			fatalError("decoding of \(Self.self) is missing")
		}
		
		public func encode(to encoder: Encoder) throws {
			
			var container = encoder.container(keyedBy: CodingKeys.self)
			
			try container.encode(self.lineno, forKey: .lineno)
			try container.encode(self.end_lineno, forKey: .end_lineno)
			try container.encode(self.col_offset, forKey: .col_offset)
			try container.encode(self.end_col_offset, forKey: .end_col_offset)
			fatalError("encoding of \(Self.self) is missing")
		}
	}
	
	public struct Await: ExprProtocol {
		public var type: AST.ExprType = .Await
		public var lineno: Int
		public var col_offset: Int
		public var end_lineno: Int?
		public var end_col_offset: Int?
		public var type_comment: String?
		
		public var value: ExprProtocol
		
		public var description: String
		
		enum CodingKeys: CodingKey {
			case arg
			case value
			
			case lineno
			case col_offset
			case end_lineno
			case end_col_offset
			case type_comment
		}
		
		public init(from decoder: Decoder) throws {
			let c: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
			
			lineno = try c.decode(Int.self, forKey: .lineno)
			col_offset = try c.decode(Int.self, forKey: .col_offset)
			end_lineno = try c.decodeIfPresent(Int.self, forKey: .end_lineno)
			end_col_offset = try c.decodeIfPresent(Int.self, forKey: .end_col_offset)
			type_comment = try c.decodeIfPresent(String.self, forKey: .type_comment)
			fatalError("decoding of \(Self.self) is missing")
		}
		
		public func encode(to encoder: Encoder) throws {
			
			var container = encoder.container(keyedBy: CodingKeys.self)
			
			try container.encode(self.lineno, forKey: .lineno)
			try container.encode(self.end_lineno, forKey: .end_lineno)
			try container.encode(self.col_offset, forKey: .col_offset)
			try container.encode(self.end_col_offset, forKey: .end_col_offset)
			fatalError("encoding of \(Self.self) is missing")
		}
	}
	
	public struct Yield: ExprProtocol {
		public var type: AST.ExprType = .Yield
		public var lineno: Int
		public var col_offset: Int
		public var end_lineno: Int?
		public var end_col_offset: Int?
		public var type_comment: String?
		
		public var value: ExprProtocol?
		
		public var description: String
		
		enum CodingKeys: CodingKey {
			case arg
			case value
			
			case lineno
			case col_offset
			case end_lineno
			case end_col_offset
			case type_comment
		}
		
		public init(from decoder: Decoder) throws {
			let c: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
			
			lineno = try c.decode(Int.self, forKey: .lineno)
			col_offset = try c.decode(Int.self, forKey: .col_offset)
			end_lineno = try c.decodeIfPresent(Int.self, forKey: .end_lineno)
			end_col_offset = try c.decodeIfPresent(Int.self, forKey: .end_col_offset)
			type_comment = try c.decodeIfPresent(String.self, forKey: .type_comment)
			fatalError("decoding of \(Self.self) is missing")
		}
		
		public func encode(to encoder: Encoder) throws {
			
			var container = encoder.container(keyedBy: CodingKeys.self)
			
			try container.encode(self.lineno, forKey: .lineno)
			try container.encode(self.end_lineno, forKey: .end_lineno)
			try container.encode(self.col_offset, forKey: .col_offset)
			try container.encode(self.end_col_offset, forKey: .end_col_offset)
			fatalError("encoding of \(Self.self) is missing")
		}
	}
	
	public struct YieldFrom: ExprProtocol {
		public var type: AST.ExprType = .YieldFrom
		public var lineno: Int
		public var col_offset: Int
		public var end_lineno: Int?
		public var end_col_offset: Int?
		public var type_comment: String?
		
		public var value: ExprProtocol
		
		public var description: String
		
		enum CodingKeys: CodingKey {
			case arg
			case value
			
			case lineno
			case col_offset
			case end_lineno
			case end_col_offset
			case type_comment
		}
		
		public init(from decoder: Decoder) throws {
			let c: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
			
			lineno = try c.decode(Int.self, forKey: .lineno)
			col_offset = try c.decode(Int.self, forKey: .col_offset)
			end_lineno = try c.decodeIfPresent(Int.self, forKey: .end_lineno)
			end_col_offset = try c.decodeIfPresent(Int.self, forKey: .end_col_offset)
			type_comment = try c.decodeIfPresent(String.self, forKey: .type_comment)
			fatalError("decoding of \(Self.self) is missing")
		}
		
		public func encode(to encoder: Encoder) throws {
			
			var container = encoder.container(keyedBy: CodingKeys.self)
			
			try container.encode(self.lineno, forKey: .lineno)
			try container.encode(self.end_lineno, forKey: .end_lineno)
			try container.encode(self.col_offset, forKey: .col_offset)
			try container.encode(self.end_col_offset, forKey: .end_col_offset)
			fatalError("encoding of \(Self.self) is missing")
		}
	}
	
	public struct Compare: ExprProtocol {
		public var type: AST.ExprType = .Compare
		public var lineno: Int
		public var col_offset: Int
		public var end_lineno: Int?
		public var end_col_offset: Int?
		public var type_comment: String?
		
		public var left: ExprProtocol
		public var ops: [CmpOp]
		public var comparators: [ExprProtocol]
		
		public var description: String
		
		enum CodingKeys: CodingKey {
			case arg
			case value
			
			case lineno
			case col_offset
			case end_lineno
			case end_col_offset
			case type_comment
		}
		
		public init(from decoder: Decoder) throws {
			let c: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
			
			lineno = try c.decode(Int.self, forKey: .lineno)
			col_offset = try c.decode(Int.self, forKey: .col_offset)
			end_lineno = try c.decodeIfPresent(Int.self, forKey: .end_lineno)
			end_col_offset = try c.decodeIfPresent(Int.self, forKey: .end_col_offset)
			type_comment = try c.decodeIfPresent(String.self, forKey: .type_comment)
			fatalError("decoding of \(Self.self) is missing")
		}
		
		public func encode(to encoder: Encoder) throws {
			
			var container = encoder.container(keyedBy: CodingKeys.self)
			
			try container.encode(self.lineno, forKey: .lineno)
			try container.encode(self.end_lineno, forKey: .end_lineno)
			try container.encode(self.col_offset, forKey: .col_offset)
			try container.encode(self.end_col_offset, forKey: .end_col_offset)
			fatalError("encoding of \(Self.self) is missing")
		}
	}
	
	public struct Call: ExprProtocol {
		public var type: AST.ExprType = .Call
		
		public var lineno: Int
		public var col_offset: Int
		public var end_lineno: Int?
		public var end_col_offset: Int?
		public var type_comment: String?
		
		public var _func: ExprProtocol
		public var args: [ExprProtocol]
		public var keywords: [Keyword]
		
		//public var description: String
		
		enum CodingKeys: String, CodingKey {
			case `func` = "func"
			case args
			case keywords
			
			case lineno
			case col_offset
			case end_lineno
			case end_col_offset
			case type_comment
		}
		
		public init(from decoder: Decoder) throws {
			let c: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
			
			_func = try c.decode(ExprProtocol.self, forKey: .func)
			args = try c.decode([ExprProtocol].self, forKey: .args)
			keywords = try c.decode([Keyword].self, forKey: .keywords)
			
			lineno = try c.decode(Int.self, forKey: .lineno)
			col_offset = try c.decode(Int.self, forKey: .col_offset)
			end_lineno = try c.decodeIfPresent(Int.self, forKey: .end_lineno)
			end_col_offset = try c.decodeIfPresent(Int.self, forKey: .end_col_offset)
			type_comment = try c.decodeIfPresent(String.self, forKey: .type_comment)
			//fatalError("decoding of \(Self.self) is missing")
		}
		
		public func encode(to encoder: Encoder) throws {
			
			var container = encoder.container(keyedBy: CodingKeys.self)
			
			try container.encode(self.lineno, forKey: .lineno)
			try container.encode(self.end_lineno, forKey: .end_lineno)
			try container.encode(self.col_offset, forKey: .col_offset)
			try container.encode(self.end_col_offset, forKey: .end_col_offset)
			fatalError("encoding of \(Self.self) is missing")
		}
	}
	
	public struct FormattedValue: ExprProtocol {
		public var type: AST.ExprType = .FormattedValue
		public var lineno: Int
		public var col_offset: Int
		public var end_lineno: Int?
		public var end_col_offset: Int?
		public var type_comment: String?
		
		public var value: ExprProtocol
		public var conversion: Int
		public var format_spec: ExprProtocol?
		
		public var description: String
		
		enum CodingKeys: CodingKey {
			case arg
			case value
			
			case lineno
			case col_offset
			case end_lineno
			case end_col_offset
			case type_comment
		}
		
		public init(from decoder: Decoder) throws {
			let c: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
			
			lineno = try c.decode(Int.self, forKey: .lineno)
			col_offset = try c.decode(Int.self, forKey: .col_offset)
			end_lineno = try c.decodeIfPresent(Int.self, forKey: .end_lineno)
			end_col_offset = try c.decodeIfPresent(Int.self, forKey: .end_col_offset)
			type_comment = try c.decodeIfPresent(String.self, forKey: .type_comment)
			fatalError("decoding of \(Self.self) is missing")
		}
		
		public func encode(to encoder: Encoder) throws {
			
			var container = encoder.container(keyedBy: CodingKeys.self)
			
			try container.encode(self.lineno, forKey: .lineno)
			try container.encode(self.end_lineno, forKey: .end_lineno)
			try container.encode(self.col_offset, forKey: .col_offset)
			try container.encode(self.end_col_offset, forKey: .end_col_offset)
			fatalError("encoding of \(Self.self) is missing")
		}
	}
	
	public struct JoinedStr: ExprProtocol {
		public var type: AST.ExprType = .JoinedStr
		public var lineno: Int
		public var col_offset: Int
		public var end_lineno: Int?
		public var end_col_offset: Int?
		public var type_comment: String?
		
		public var values: [ExprProtocol]
		
		public var description: String
		
		enum CodingKeys: CodingKey {
			case arg
			case value
			
			case lineno
			case col_offset
			case end_lineno
			case end_col_offset
			case type_comment
		}
		
		public init(from decoder: Decoder) throws {
			let c: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
			
			lineno = try c.decode(Int.self, forKey: .lineno)
			col_offset = try c.decode(Int.self, forKey: .col_offset)
			end_lineno = try c.decodeIfPresent(Int.self, forKey: .end_lineno)
			end_col_offset = try c.decodeIfPresent(Int.self, forKey: .end_col_offset)
			type_comment = try c.decodeIfPresent(String.self, forKey: .type_comment)
			fatalError("decoding of \(Self.self) is missing")
		}
		
		public func encode(to encoder: Encoder) throws {
			
			var container = encoder.container(keyedBy: CodingKeys.self)
			
			try container.encode(self.lineno, forKey: .lineno)
			try container.encode(self.end_lineno, forKey: .end_lineno)
			try container.encode(self.col_offset, forKey: .col_offset)
			try container.encode(self.end_col_offset, forKey: .end_col_offset)
			fatalError("encoding of \(Self.self) is missing")
		}
	}
	
	public struct Constant: ExprProtocol {
		public var type: AST.ExprType = .Constant
		public var lineno: Int
		public var col_offset: Int
		public var end_lineno: Int?
		public var end_col_offset: Int?
		public var type_comment: String?
		
		// public var value: Any
		public var value: String? // ?
		public var kind: String?
		public var s: Any?
		public var n: String
		
		public var description: String { "( <\(Self.self)> \(value) )" }
		
		enum CodingKeys: CodingKey {
			case value
			case kind
			case n
			
			case lineno
			case col_offset
			case end_lineno
			case end_col_offset
			case type_comment
		}
		
		public init(from decoder: Decoder) throws {
			let c: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
			let _value = try c.decode(String.self, forKey: .value)
			switch _value {
			case "Ellipsis": value = "..."
			case "None": value = nil
			default: value = _value
			}
			kind = try c.decodeIfPresent(String.self, forKey: .kind)
			let _n = try c.decode(String.self, forKey: .n)
			switch _n {
			case "Ellipsis": n = "..."
			default: n = _n
			}
			lineno = try c.decode(Int.self, forKey: .lineno)
			col_offset = try c.decode(Int.self, forKey: .col_offset)
			end_lineno = try c.decodeIfPresent(Int.self, forKey: .end_lineno)
			end_col_offset = try c.decodeIfPresent(Int.self, forKey: .end_col_offset)
			type_comment = try c.decodeIfPresent(String.self, forKey: .type_comment)
			//fatalError("decoding of \(Self.self) is missing")
		}
		
		public func encode(to encoder: Encoder) throws {
			
			var container = encoder.container(keyedBy: CodingKeys.self)
			
			try container.encode(self.lineno, forKey: .lineno)
			try container.encode(self.end_lineno, forKey: .end_lineno)
			try container.encode(self.col_offset, forKey: .col_offset)
			try container.encode(self.end_col_offset, forKey: .end_col_offset)
			fatalError("encoding of \(Self.self) is missing")
		}
		
		public var intValue: Int? {
			guard let value = value else { return nil}
			return Int(value)
		}
		public var floatValue: Double? {
			guard let value = value else { return nil }
			return Double(value)
		}
	}
	
	public struct NamedExpr: ExprProtocol {
		public var type: AST.ExprType = .NamedExpr
		public var lineno: Int
		public var col_offset: Int
		public var end_lineno: Int?
		public var end_col_offset: Int?
		public var type_comment: String?
		
		public var target: Name
		public var value: ExprProtocol
		
		public var description: String
		
		enum CodingKeys: CodingKey {
			case arg
			case value
			
			case lineno
			case col_offset
			case end_lineno
			case end_col_offset
			case type_comment
		}
		
		public init(from decoder: Decoder) throws {
			let c: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
			
			lineno = try c.decode(Int.self, forKey: .lineno)
			col_offset = try c.decode(Int.self, forKey: .col_offset)
			end_lineno = try c.decodeIfPresent(Int.self, forKey: .end_lineno)
			end_col_offset = try c.decodeIfPresent(Int.self, forKey: .end_col_offset)
			type_comment = try c.decodeIfPresent(String.self, forKey: .type_comment)
			fatalError("decoding of \(Self.self) is missing")
		}
		
		public func encode(to encoder: Encoder) throws {
			
			var container = encoder.container(keyedBy: CodingKeys.self)
			
			try container.encode(self.lineno, forKey: .lineno)
			try container.encode(self.end_lineno, forKey: .end_lineno)
			try container.encode(self.col_offset, forKey: .col_offset)
			try container.encode(self.end_col_offset, forKey: .end_col_offset)
			fatalError("encoding of \(Self.self) is missing")
		}
	}
	
	public struct Attribute: ExprProtocol {
		public var type: AST.ExprType = .Attribute
		public var lineno: Int
		public var col_offset: Int
		public var end_lineno: Int?
		public var end_col_offset: Int?
		public var type_comment: String?
		
		public var value: ExprProtocol
		public var attr: String
		// var ctx: ExprContext
		
		public var description: String
		
		enum CodingKeys: CodingKey {
			case arg
			case value
			
			case lineno
			case col_offset
			case end_lineno
			case end_col_offset
			case type_comment
		}
		
		public init(from decoder: Decoder) throws {
			let c: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
			
			lineno = try c.decode(Int.self, forKey: .lineno)
			col_offset = try c.decode(Int.self, forKey: .col_offset)
			end_lineno = try c.decodeIfPresent(Int.self, forKey: .end_lineno)
			end_col_offset = try c.decodeIfPresent(Int.self, forKey: .end_col_offset)
			type_comment = try c.decodeIfPresent(String.self, forKey: .type_comment)
			fatalError("decoding of \(Self.self) is missing")
		}
		
		public func encode(to encoder: Encoder) throws {
			
			var container = encoder.container(keyedBy: CodingKeys.self)
			
			try container.encode(self.lineno, forKey: .lineno)
			try container.encode(self.end_lineno, forKey: .end_lineno)
			try container.encode(self.col_offset, forKey: .col_offset)
			try container.encode(self.end_col_offset, forKey: .end_col_offset)
			fatalError("encoding of \(Self.self) is missing")
		}
	}
	
	public struct Slice: ExprProtocol {
		public var type: AST.ExprType = .Slice
		public var lineno: Int
		public var col_offset: Int
		public var end_lineno: Int?
		public var end_col_offset: Int?
		public var type_comment: String?
		
		public var lower: ExprProtocol?
		public var upper: ExprProtocol?
		public var step: ExprProtocol?
		
		public var description: String { "(\(Self.self) lower: \(lower), upper: \(upper), step: \(step)"}
		
		enum CodingKeys: CodingKey {
			case lower
			case upper
			case step
			
			case lineno
			case col_offset
			case end_lineno
			case end_col_offset
			case type_comment
		}
		
		public init(from decoder: Decoder) throws {
			let c: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
			lower = try c.decodeIfPresent(ExprProtocol.self, forKey: .lower)
			upper = try c.decodeIfPresent(ExprProtocol.self, forKey: .upper)
			step = try c.decodeIfPresent(ExprProtocol.self, forKey: .step)
			
			lineno = try c.decode(Int.self, forKey: .lineno)
			col_offset = try c.decode(Int.self, forKey: .col_offset)
			end_lineno = try c.decodeIfPresent(Int.self, forKey: .end_lineno)
			end_col_offset = try c.decodeIfPresent(Int.self, forKey: .end_col_offset)
			type_comment = try c.decodeIfPresent(String.self, forKey: .type_comment)
			//fatalError("decoding of \(Self.self) is missing")
		}
		
		public func encode(to encoder: Encoder) throws {
			
			var container = encoder.container(keyedBy: CodingKeys.self)
			
			try container.encode(self.lineno, forKey: .lineno)
			try container.encode(self.end_lineno, forKey: .end_lineno)
			try container.encode(self.col_offset, forKey: .col_offset)
			try container.encode(self.end_col_offset, forKey: .end_col_offset)
			fatalError("encoding of \(Self.self) is missing")
		}
	}
	
	
	
	
	public struct Subscript: ExprProtocol {
		public var type: AST.ExprType = .Subscript
		public var lineno: Int
		public var col_offset: Int
		public var end_lineno: Int?
		public var end_col_offset: Int?
		public var type_comment: String?
		
		public var value: ExprProtocol
		public var slice: ExprProtocol
		// var ctx: ExprContext
		
		public var description: String { "(\(Self.self) value: \(value), slice: \(slice)"}
		
		enum CodingKeys: CodingKey {
			case value
			case slice
			
			case lineno
			case col_offset
			case end_lineno
			case end_col_offset
			case type_comment
		}
		
		public init(from decoder: Decoder) throws {
			let c: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
			value = try c.decode(ExprProtocol.self, forKey: .value)
			slice = try c.decode(ExprProtocol.self, forKey: .slice)
			
			lineno = try c.decode(Int.self, forKey: .lineno)
			col_offset = try c.decode(Int.self, forKey: .col_offset)
			end_lineno = try c.decodeIfPresent(Int.self, forKey: .end_lineno)
			end_col_offset = try c.decodeIfPresent(Int.self, forKey: .end_col_offset)
			type_comment = try c.decodeIfPresent(String.self, forKey: .type_comment)
			//fatalError("decoding of \(Self.self) is missing")
		}
		
		public func encode(to encoder: Encoder) throws {
			
			var container = encoder.container(keyedBy: CodingKeys.self)
			
			try container.encode(self.lineno, forKey: .lineno)
			try container.encode(self.end_lineno, forKey: .end_lineno)
			try container.encode(self.col_offset, forKey: .col_offset)
			try container.encode(self.end_col_offset, forKey: .end_col_offset)
			fatalError("encoding of \(Self.self) is missing")
		}
	}
	
	public struct Starred: ExprProtocol {
		public var type: AST.ExprType = .Starred
		public var lineno: Int
		public var col_offset: Int
		public var end_lineno: Int?
		public var end_col_offset: Int?
		public var type_comment: String?
		
		public var value: ExprProtocol
		// var ctx: ExprContext
		public var description: String
		
		enum CodingKeys: CodingKey {
			case arg
			case value
			
			case lineno
			case col_offset
			case end_lineno
			case end_col_offset
			case type_comment
		}
		
		public init(from decoder: Decoder) throws {
			let c: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
			
			lineno = try c.decode(Int.self, forKey: .lineno)
			col_offset = try c.decode(Int.self, forKey: .col_offset)
			end_lineno = try c.decodeIfPresent(Int.self, forKey: .end_lineno)
			end_col_offset = try c.decodeIfPresent(Int.self, forKey: .end_col_offset)
			type_comment = try c.decodeIfPresent(String.self, forKey: .type_comment)
			fatalError("decoding of \(Self.self) is missing")
		}
		
		public func encode(to encoder: Encoder) throws {
			
			var container = encoder.container(keyedBy: CodingKeys.self)
			
			try container.encode(self.lineno, forKey: .lineno)
			try container.encode(self.end_lineno, forKey: .end_lineno)
			try container.encode(self.col_offset, forKey: .col_offset)
			try container.encode(self.end_col_offset, forKey: .end_col_offset)
			fatalError("encoding of \(Self.self) is missing")
		}
	}
	
	public struct Name: ExprProtocol {
		public init(id: String, lineno: Int = -1, col_offset: Int = -1, end_lineno: Int? = nil, end_col_offset: Int? = nil, type_comment: String? = nil) {

			self.lineno = lineno
			self.col_offset = col_offset
			self.end_lineno = end_lineno
			self.end_col_offset = end_col_offset
			self.type_comment = type_comment
			self.id = id
		}
		
		public let type: AST.ExprType = .Name
		public var lineno: Int
		public var col_offset: Int
		public var end_lineno: Int?
		public var end_col_offset: Int?
		public var type_comment: String?
		
		public var id: String
		// var ctx: ExprContext
		
		public var description: String { id }
		
		enum CodingKeys: CodingKey {
			case id
			//case value
			
			case lineno
			case col_offset
			case end_lineno
			case end_col_offset
			case type_comment
		}
		
		public init(from decoder: Decoder) throws {
			let c: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
			id = try c.decode(String.self, forKey: .id)
			lineno = try c.decode(Int.self, forKey: .lineno)
			col_offset = try c.decode(Int.self, forKey: .col_offset)
			end_lineno = try c.decodeIfPresent(Int.self, forKey: .end_lineno)
			end_col_offset = try c.decodeIfPresent(Int.self, forKey: .end_col_offset)
			type_comment = try c.decodeIfPresent(String.self, forKey: .type_comment)
			//fatalError("decoding of \(Self.self) is missing")
		}
		
		public func encode(to encoder: Encoder) throws {
			
			var container = encoder.container(keyedBy: CodingKeys.self)
			
			try container.encode(self.lineno, forKey: .lineno)
			try container.encode(self.end_lineno, forKey: .end_lineno)
			try container.encode(self.col_offset, forKey: .col_offset)
			try container.encode(self.end_col_offset, forKey: .end_col_offset)
			fatalError("encoding of \(Self.self) is missing")
		}
	}
	
	public struct List: ExprProtocol {
		public var type: AST.ExprType = .List
		public var lineno: Int
		public var col_offset: Int
		public var end_lineno: Int?
		public var end_col_offset: Int?
		public var type_comment: String?
		
		public var elts: [ExprProtocol]
		// var ctx: ExprContext
		
		//public var description: String
		
		enum CodingKeys: CodingKey {
			case elts
			
			case lineno
			case col_offset
			case end_lineno
			case end_col_offset
			case type_comment
		}
		
		public init(from decoder: Decoder) throws {
			let c: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
			
			elts = try c.decode([ExprProtocol].self, forKey: .elts)
			
			lineno = try c.decode(Int.self, forKey: .lineno)
			col_offset = try c.decode(Int.self, forKey: .col_offset)
			end_lineno = try c.decodeIfPresent(Int.self, forKey: .end_lineno)
			end_col_offset = try c.decodeIfPresent(Int.self, forKey: .end_col_offset)
			type_comment = try c.decodeIfPresent(String.self, forKey: .type_comment)
			//fatalError("decoding of \(Self.self) is missing")
		}
		
		public func encode(to encoder: Encoder) throws {
			
			var container = encoder.container(keyedBy: CodingKeys.self)
			
			try container.encode(self.lineno, forKey: .lineno)
			try container.encode(self.end_lineno, forKey: .end_lineno)
			try container.encode(self.col_offset, forKey: .col_offset)
			try container.encode(self.end_col_offset, forKey: .end_col_offset)
			fatalError("encoding of \(Self.self) is missing")
		}
	}
	
	public struct Tuple: ExprProtocol {
		public var type: AST.ExprType = .Tuple
		public var lineno: Int
		public var col_offset: Int
		public var end_lineno: Int?
		public var end_col_offset: Int?
		public var type_comment: String?
		
		public var elts: [ExprProtocol]
		// var ctx: ExprContext
		public var dims: [ExprProtocol]?
		
		//public var description: String
		
		enum CodingKeys: CodingKey {
			case elts
			case dims
			
			case lineno
			case col_offset
			case end_lineno
			case end_col_offset
			case type_comment
		}
		
		public init(from decoder: Decoder) throws {
			let c: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
			elts = try c.decode([ExprProtocol].self, forKey: .elts)
			
			dims = try c.decodeIfPresent([ExprProtocol].self, forKey: .elts)
			lineno = try c.decode(Int.self, forKey: .lineno)
			col_offset = try c.decode(Int.self, forKey: .col_offset)
			end_lineno = try c.decodeIfPresent(Int.self, forKey: .end_lineno)
			end_col_offset = try c.decodeIfPresent(Int.self, forKey: .end_col_offset)
			type_comment = try c.decodeIfPresent(String.self, forKey: .type_comment)
			//fatalError("decoding of \(Self.self) is missing")
		}
		
		public func encode(to encoder: Encoder) throws {
			
			var container = encoder.container(keyedBy: CodingKeys.self)
			
			try container.encode(self.lineno, forKey: .lineno)
			try container.encode(self.end_lineno, forKey: .end_lineno)
			try container.encode(self.col_offset, forKey: .col_offset)
			try container.encode(self.end_col_offset, forKey: .end_col_offset)
			fatalError("encoding of \(Self.self) is missing")
		}
	}
}
