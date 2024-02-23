import Foundation

public extension AST {
	
	/**
	 
	 python
	 
	 ```python
	 class AnnAssign(stmt):
		 if sys.version_info >= (3, 10):
		 __match_args__ = ("target", "annotation", "value", "simple")
		 target: Name | Attribute | Subscript
		 annotation: expr
		 value: expr | None
		 simple: int
	 ```
	 */
	
	public struct AnnAssign: Stmt {
		
		
		public var type: StmtType = .AnnAssign
		
		public var description: String { "(<\(Self.self)> \(target): \(annotation))" }
		
		//var pyPointer: PyPointer
		
		
		//public var name: String
		
		public var target: ExprProtocol
		
		public var annotation: ExprProtocol
		
		public var value: ExprProtocol?
		
		public var simple: Int
		
		public var lineno: Int
		public var col_offset: Int
		
		public var end_lineno: Int?
		public var end_col_offset: Int?
		public var type_comment: String?
		
		
		public init(from decoder: Decoder) throws {
			let c = try decoder.container(keyedBy: CodingKeys.self)
			target = try c.decode(ExprProtocol.self, forKey: .target)
			annotation = try c.decode(ExprProtocol.self, forKey: .annotation)
			value = try try c.decodeIfPresent(ExprProtocol.self, forKey: .value)
			simple = try c.decode(Int.self, forKey: .simple)
			
			lineno = try c.decode(Int.self, forKey: .lineno)
			col_offset = try c.decode(Int.self, forKey: .col_offset)
			end_lineno = try c.decodeIfPresent(Int.self, forKey: .end_lineno)
			end_col_offset = try c.decodeIfPresent(Int.self, forKey: .end_col_offset)
			type_comment = try c.decodeIfPresent(String.self, forKey: .type_comment)
			//fatalError()
		}
		enum CodingKeys: CodingKey {
			case target
			case annotation
			case value
			case simple
			
			case lineno
			case col_offset
			case end_lineno
			case end_col_offset
			case type_comment
		}
		//
		public func encode(to encoder: Encoder) throws {
			fatalError()
		}
	}
	
	
	
}

