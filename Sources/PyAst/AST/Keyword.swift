
import Foundation


extension AST {
	/*
	 
	 */
	public struct Keyword: AstProtocol {
		public var arg: String?
		public var value: ExprProtocol
		
		public var lineno: Int
		public var col_offset: Int
		
		public let end_lineno: Int?
		public let end_col_offset: Int?
		public let type_comment: String?
		
		public var name: String { arg ?? "" }
		
		enum CodingKeys: CodingKey {
			case __class__
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
			
			arg = try c.decodeIfPresent(String.self, forKey: .arg)
			value = try c.decode(ExprProtocol.self, forKey: .value)
			
			lineno = try c.decode(Int.self, forKey: .lineno)
			col_offset = try c.decode(Int.self, forKey: .col_offset)
			end_lineno = try c.decodeIfPresent(Int.self, forKey: .end_lineno)
			end_col_offset = try c.decodeIfPresent(Int.self, forKey: .end_col_offset)
			type_comment = try c.decodeIfPresent(String.self, forKey: .type_comment)
			//fatalError("decoding of \(Self.self) is missing")
		}
		
		public func encode(to encoder: Encoder) throws {
			
			var container = encoder.container(keyedBy: CodingKeys.self)
			
			try container.encode(self.arg, forKey: .arg)
			try container.encode(self.value, forKey: .value)
			
			try container.encode(self.lineno, forKey: .lineno)
			try container.encode(self.end_lineno, forKey: .end_lineno)
			try container.encode(self.col_offset, forKey: .col_offset)
			try container.encode(self.end_col_offset, forKey: .end_col_offset)
			//fatalError("encoding of \(Self.self) is missing")
		}
	}
}
