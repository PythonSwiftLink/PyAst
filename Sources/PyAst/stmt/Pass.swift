
import Foundation

public extension AST {
	struct Pass: Stmt {
		public init(description: String = "\(Self.self)", lineno: Int = 0, col_offset: Int = 0, end_lineno: Int? = nil, end_col_offset: Int? = nil, type_comment: String? = nil) {
			self.description = description
			self.lineno = lineno
			self.col_offset = col_offset
			self.end_lineno = end_lineno
			self.end_col_offset = end_col_offset
			self.type_comment = type_comment
		}
		
		public let type: AST.StmtType = .Pass
		
		public var description: String = "\(Self.self)"
		
		public var lineno: Int
		public var col_offset: Int
		
		public let end_lineno: Int?
		public let end_col_offset: Int?
		public let type_comment: String?
		
		enum CodingKeys: CodingKey {
			case __class__
			
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
			//fatalError("decoding of \(Self.self) is missing")
		}
		
		public func encode(to encoder: Encoder) throws {
			
			var container = encoder.container(keyedBy: CodingKeys.self)
			try container.encode(type, forKey: .__class__)
			try container.encode(self.lineno, forKey: .lineno)
			try container.encode(self.end_lineno, forKey: .end_lineno)
			try container.encode(self.col_offset, forKey: .col_offset)
			try container.encode(self.end_col_offset, forKey: .end_col_offset)
			fatalError("encoding of \(Self.self) is missing")
		}
	}

	
	
	struct NoneType: ExprProtocol, CustomStringConvertible {
		public let type: AST.ExprType = .NoneType
		
		public var description: String = "None"
		
		public var lineno: Int
		public var col_offset: Int
		
		public let end_lineno: Int?
		public let end_col_offset: Int?
		public let type_comment: String?
		
		
		enum CodingKeys: CodingKey {
			case __class__
			
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
			//fatalError("decoding of \(Self.self) is missing")
		}
		
		public func encode(to encoder: Encoder) throws {
			
			var container = encoder.container(keyedBy: CodingKeys.self)
			try container.encode(type, forKey: .__class__)
			try container.encode(self.lineno, forKey: .lineno)
			try container.encode(self.end_lineno, forKey: .end_lineno)
			try container.encode(self.col_offset, forKey: .col_offset)
			try container.encode(self.end_col_offset, forKey: .end_col_offset)
			fatalError("encoding of \(Self.self) is missing")
		}
	}
}
