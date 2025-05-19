
import Foundation


extension AST {
	/*
	 Keyword(identifier? arg, expr value)
	 attributes (int lineno, int col_offset, int? end_lineno, int? end_col_offset)
	 
	 
	 */
	public struct Arg: AstProtocol {
		public var arg: String
		public var annotation: ExprProtocol?
		
		public var lineno: Int
		public var col_offset: Int
		
		public let end_lineno: Int?
		public let end_col_offset: Int?
		public let type_comment: String?
		
		public var name: String { arg }
		
		//public var description: String { "\(arg): \(annotation?.description ?? "object")"}
		enum CodingKeys: CodingKey {
			case __class__
			case arg
			case annotation
			
			case lineno
			case col_offset
			case end_lineno
			case end_col_offset
			case type_comment
		}
		
		public init(label: String) {
			arg = label
			lineno = -1
			col_offset = -1
			end_col_offset = nil
			end_lineno = nil
			type_comment = nil
		}
        
        public init(arg: String, annotation: ExprProtocol) {
            self.arg = arg
            self.annotation = annotation
            
            lineno = -1
            col_offset = -1
            end_col_offset = nil
            end_lineno = nil
            type_comment = nil
            
        }
		
		public init(from decoder: Decoder) throws {
			let c: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
			
			arg = try c.decode(String.self, forKey: .arg)
			annotation = try c.decodeIfPresent(ExprProtocol.self, forKey: .annotation)
			
			lineno = try c.decode(Int.self, forKey: .lineno)
			col_offset = try c.decode(Int.self, forKey: .col_offset)
			end_lineno = try c.decodeIfPresent(Int.self, forKey: .end_lineno)
			end_col_offset = try c.decodeIfPresent(Int.self, forKey: .end_col_offset)
			type_comment = try c.decodeIfPresent(String.self, forKey: .type_comment)
			
		}
		
		public func encode(to encoder: Encoder) throws {
			
			var container = encoder.container(keyedBy: CodingKeys.self)
			
			try container.encode(self.arg, forKey: .arg)
			try container.encodeIfPresent(self.annotation, forKey: .annotation)
			
			try container.encode(self.lineno, forKey: .lineno)
			try container.encode(self.end_lineno, forKey: .end_lineno)
			try container.encode(self.col_offset, forKey: .col_offset)
			try container.encode(self.end_col_offset, forKey: .end_col_offset)
			try container.encode(type_comment, forKey: .type_comment)
		}
	}
}
