import Foundation

extension AST {
	
	
	public struct FunctionDef: Stmt {
		
		
		public var type: StmtType = .FunctionDef
		
		public var description: String { "(<\(Self.self)> name( \(args) )" }
		
		//var pyPointer: PyPointer
		
		
		public var name: String
		
		public var args: Arguments
		
		public var body: [Stmt]
		
		public var decorator_list: [ExprProtocol]
		
		public var returns: ExprProtocol?
		
		public var lineno: Int
		public var col_offset: Int
		
		public var end_lineno: Int?
		public var end_col_offset: Int?
		public var type_comment: String?
		
		
		public init(from decoder: Decoder) throws {
			let c = try decoder.container(keyedBy: CodingKeys.self)
			name = try c.decode(String.self, forKey: .name)
			args = try c.decode(Arguments.self, forKey: .args)
			body = try c.decode([Stmt].self, forKey: .body)
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
			case args
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

