import Foundation

extension AST {
	
	/**
	 
	 python
	 
	 ```python
	 class ClassDef(stmt):
		 if sys.version_info >= (3, 12):
			__match_args__ = ("name", "bases", "keywords", "body", "decorator_list", "type_params")
		 elif sys.version_info >= (3, 10):
			__match_args__ = ("name", "bases", "keywords", "body", "decorator_list")
		 name: _Identifier
		 bases: list[expr]
		 keywords: list[keyword]
		 body: list[stmt]
		 decorator_list: list[expr]
		 if sys.version_info >= (3, 12):
			type_params: list[type_param]
	 ```
	 */
	
	public struct ClassDef: Stmt {
		
		
		public var type: StmtType = .ClassDef
		
		public var description: String { "<\(Self.self)> \(name)" }
		
		//var pyPointer: PyPointer
		
		
		public var name: String
		
		public var bases: [ExprProtocol]
		
		public var keywords: [Keyword]
		
		public var body: [Stmt]
		
		public var decorator_list: [ExprProtocol]
		
		public var lineno: Int
		public var col_offset: Int
		
		public var end_lineno: Int?
		public var end_col_offset: Int?
		public var type_comment: String?
		
		
		public init(from decoder: Decoder) throws {
			let c = try decoder.container(keyedBy: CodingKeys.self)
			name = try c.decode(String.self, forKey: .name)
			bases = try c.decode([ExprProtocol].self, forKey: .bases)
			keywords = try c.decode([Keyword].self, forKey: .keywords)
			body = try c.decode([Stmt].self, forKey: .body)
			decorator_list = try! c.decode([ExprProtocol].self, forKey: .decorator_list)
			
			lineno = try c.decode(Int.self, forKey: .lineno)
			col_offset = try c.decode(Int.self, forKey: .col_offset)
			end_lineno = try c.decodeIfPresent(Int.self, forKey: .end_lineno)
			end_col_offset = try c.decodeIfPresent(Int.self, forKey: .end_col_offset)
			type_comment = try c.decodeIfPresent(String.self, forKey: .type_comment)
			//fatalError()
		}
		enum CodingKeys: CodingKey {
			case __class__
			case name
			case bases
			case keywords
			case body
			case decorator_list
			
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
			try c.encode(name, forKey: .name)
			try c.encode(bases, forKey: .bases)
			try c.encode(keywords, forKey: .keywords)
			try c.encode(body, forKey: .body)
			try c.encode(decorator_list, forKey: .decorator_list)
			
			try c.encode(lineno, forKey: .lineno)
			try c.encode(col_offset, forKey: .col_offset)
			try c.encode(end_lineno, forKey: .end_lineno)
			try c.encode(end_col_offset, forKey: .end_col_offset)
			try c.encode(type_comment, forKey: .type_comment)
		}
	}
	
	
	
	
}

