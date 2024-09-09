import Foundation

extension AST {
	
	
	public struct FunctionDef: Stmt {
		public init( name: String, args: AST.Arguments, body: [Stmt], decorator_list: [ExprProtocol], returns: ExprProtocol? = nil, lineno: Int, col_offset: Int, end_lineno: Int? = nil, end_col_offset: Int? = nil, type_comment: String? = nil) {
			self.name = name
			self.args = args
			self.body = body
			self.decorator_list = decorator_list
			self.returns = returns
			self.lineno = lineno
			self.col_offset = col_offset
			self.end_lineno = end_lineno
			self.end_col_offset = end_col_offset
			self.type_comment = type_comment
		}
		
		
		
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
			case __class__
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
			var container = encoder.container(keyedBy: CodingKeys.self)
			try container.encode(type, forKey: .__class__)
			try container.encode(self.name, forKey: .name)
			try container.encode(self.args, forKey: .args)
			try container.encode(self.body, forKey: .body)
			try container.encode(self.decorator_list, forKey: .decorator_list)
			try container.encodeIfPresent(returns, forKey: .returns)
			
			try container.encode(self.lineno, forKey: .lineno)
			try container.encode(self.end_lineno, forKey: .end_lineno)
			try container.encode(self.col_offset, forKey: .col_offset)
			try container.encode(self.end_col_offset, forKey: .end_col_offset)
			try container.encode(type_comment, forKey: .type_comment)
		}
	}
	
	
	
}

