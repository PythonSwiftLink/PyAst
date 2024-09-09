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
		public init(type: AST.StmtType = .ImportFrom, module: String? = nil, names: [AST.Alias], level: Int, lineno: Int, col_offset: Int, end_lineno: Int? = nil, end_col_offset: Int? = nil, type_comment: String? = nil) {
			self.type = type
			self.module = module
			self.names = names
			self.level = level
			self.lineno = lineno
			self.col_offset = col_offset
			self.end_lineno = end_lineno
			self.end_col_offset = end_col_offset
			self.type_comment = type_comment
		}
		
		
		
		public var type: StmtType = .ImportFrom
		
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
			case __class__
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
			var c = encoder.container(keyedBy: CodingKeys.self)
			try c.encode(type, forKey: .__class__)
			try c.encode(module, forKey: .module)
			try c.encode(names, forKey: .names)
			try c.encode(level, forKey: .level)
			
			try c.encode(lineno, forKey: .lineno)
			try c.encode(col_offset, forKey: .col_offset)
			try c.encode(end_lineno, forKey: .end_lineno)
			try c.encode(end_col_offset, forKey: .end_col_offset)
			try c.encode(type_comment, forKey: .type_comment)
		}
	}
	
	
	
}

