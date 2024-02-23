import Foundation

public extension AST {
	
	/**
	 
	 python
	 
	 ```python

	 ```
	 */
	
	public struct Assign: Stmt {
		
		
		public var type: StmtType = .Assign
		
		//public var description: String { "(<\(Self.self)> \(target): \(annotation))" }
		
		//var pyPointer: PyPointer
		
		
		//public var name: String
		
		public var targets: [ExprProtocol]
		
		public var value: ExprProtocol
		
		
		public var lineno: Int
		public var col_offset: Int
		
		public var end_lineno: Int?
		public var end_col_offset: Int?
		public var type_comment: String?
		
		
		public init(from decoder: Decoder) throws {
			let c = try decoder.container(keyedBy: CodingKeys.self)
			targets = try c.decode([ExprProtocol].self, forKey: .targets)
			value = try try c.decode(ExprProtocol.self, forKey: .value)
			
			lineno = try c.decode(Int.self, forKey: .lineno)
			col_offset = try c.decode(Int.self, forKey: .col_offset)
			end_lineno = try c.decodeIfPresent(Int.self, forKey: .end_lineno)
			end_col_offset = try c.decodeIfPresent(Int.self, forKey: .end_col_offset)
			type_comment = try c.decodeIfPresent(String.self, forKey: .type_comment)
			//fatalError()
		}
		enum CodingKeys: CodingKey {
			case targets
			case value
			
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

