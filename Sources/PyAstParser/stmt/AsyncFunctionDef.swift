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
	
	public struct AsyncFunctionDef: Stmt {
		
		
		public var type: StmtType = .AsyncFunctionDef
		
		public var description: String { name }
		
		//var pyPointer: PyPointer
		
		
		public var name: String
		
		public var bases: [ExprProtocol]
		
		public var body: [Stmt]
		
		public var decorator_list: [ExprProtocol]
		
		public var returns: ExprProtocol?
		
		public var lineno: Int
		public var col_offset: Int
		
		public let end_lineno: Int?
		public let end_col_offset: Int?
		public let type_comment: String?
		
		
		public init(from decoder: Decoder) throws {
			let c = try decoder.container(keyedBy: CodingKeys.self)
			name = try c.decode(String.self, forKey: .name)
			bases = try c.decode([ExprProtocol].self, forKey: .bases)
			body = try c.decode([Stmt].self, forKey: .bases)
			decorator_list = try c.decode([ExprProtocol].self, forKey: .decorator_list)
			returns = try c.decodeIfPresent((any ExprProtocol).self, forKey: .returns)
			
			lineno = try c.decode(Int.self, forKey: .lineno)
			col_offset = try c.decode(Int.self, forKey: .col_offset)
			end_lineno = try c.decodeIfPresent(Int.self, forKey: .end_lineno)
			end_col_offset = try c.decodeIfPresent(Int.self, forKey: .end_col_offset)
			type_comment = try c.decodeIfPresent(String.self, forKey: .type_comment)
			//fatalError()
		}
		enum CodingKeys: CodingKey {
			case name
			case bases
			case body
			case decorator_list
			case returns
			
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

