import Foundation

extension AST {
	
	/**
	 
	 python
	 
	 ```python
	 class ImportFrom(stmt):
		 if sys.version_info >= (3, 10):
			__match_args__ = ("module", "names", "level")
		 module: str | None
		 names: list[alias]
		 level: int
	 ```
	 */
	
	public struct ImportFrom: Stmt {
		
		
		public var type: StmtType = .ClassDef
		
		//public var description: String { "<\(Self.self)> \(name)" }
		
		//var pyPointer: PyPointer
		
		
		public var module: String?
		
		public var names: [Alias]
		
		public var level: Int
		
		public var lineno: Int
		public var col_offset: Int
		
		public var end_lineno: Int?
		public var end_col_offset: Int?
		public var type_comment: String?
		
		
		public init(from decoder: Decoder) throws {
			let c = try decoder.container(keyedBy: CodingKeys.self)
			module = try c.decodeIfPresent(String.self, forKey: .module)
			names = try c.decode([Alias].self, forKey: .names)
			level = try c.decode(Int.self, forKey: .level)
			
			lineno = try c.decode(Int.self, forKey: .lineno)
			col_offset = try c.decode(Int.self, forKey: .col_offset)
			end_lineno = try c.decodeIfPresent(Int.self, forKey: .end_lineno)
			end_col_offset = try c.decodeIfPresent(Int.self, forKey: .end_col_offset)
			type_comment = try c.decodeIfPresent(String.self, forKey: .type_comment)
			//fatalError()
		}
		enum CodingKeys: CodingKey {
			case module
			case names
			case level

			
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

