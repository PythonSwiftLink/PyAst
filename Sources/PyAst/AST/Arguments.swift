
import Foundation


extension AST {

	public struct Arguments: AstProtocol {
		public init(args: [AST.Arg], vararg: AST.Arg? = nil, kwonlyargs: [AST.Arg], kw_defaults: [ExprProtocol], kwarg: AST.Arg? = nil, defaults: [ExprProtocol], lineno: Int = 0, col_offset: Int = 0) {
			self.args = args
			self.vararg = vararg
			self.kwonlyargs = kwonlyargs
			self.kw_defaults = kw_defaults
			self.kwarg = kwarg
			self.defaults = defaults
			self.lineno = lineno
			self.col_offset = col_offset
		}
		
		public var args: [Arg]
		public var vararg: Arg?
		public var kwonlyargs: [Arg]
		public var kw_defaults: [ExprProtocol]
		public var kwarg: Arg?
		public var defaults: [ExprProtocol]
		
		public var lineno: Int = 0
		public var col_offset: Int = 0
		
		public let end_lineno: Int? = nil
		public let end_col_offset: Int? = nil
		public let type_comment: String? = nil
		
		public var name: String { "?" }
		//public var description: String { "\(args.map(\.description).joined(separator: ", "))" }
		
		enum CodingKeys: CodingKey {
			case __class__
			case args
			case vararg
			case kwonlyargs
			case kw_defaults
			case kwarg
			case defaults
			
//			case lineno
//			case col_offset
//			case end_lineno
//			case end_col_offset
//			case type_comment
		}
		
		public init(from decoder: Decoder) throws {
			let c: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
			args = try c.decode([Arg].self, forKey: .args)
			vararg = try c.decodeIfPresent(Arg.self, forKey: .vararg)
			kwonlyargs = try c.decode([Arg].self, forKey: .kwonlyargs)
			kw_defaults = try c.decode([ExprProtocol].self, forKey: .kw_defaults)
			kwarg = try c.decodeIfPresent(Arg.self, forKey: .kwarg)
			defaults = try c.decode([ExprProtocol].self, forKey: .defaults)
//			lineno = try c.decode(Int.self, forKey: .lineno)
//			col_offset = try c.decode(Int.self, forKey: .col_offset)
//			end_lineno = try c.decodeIfPresent(Int.self, forKey: .end_lineno)
//			end_col_offset = try c.decodeIfPresent(Int.self, forKey: .end_col_offset)
//			type_comment = try c.decodeIfPresent(String.self, forKey: .type_comment)
			//fatalError("decoding of \(Self.self) is missing")
		}
		
		public func encode(to encoder: Encoder) throws {
			var container = encoder.container(keyedBy: CodingKeys.self)
			//try container.encode(type, forKey: .__class__)
			try container.encode(self.args, forKey: .args)
			try container.encode(self.vararg, forKey: .vararg)
			try container.encode(self.kwonlyargs, forKey: .kwonlyargs)
			try container.encode(self.kw_defaults, forKey: .kw_defaults)
			try container.encode(self.kwarg, forKey: .kwarg)
			try container.encode(self.defaults, forKey: .defaults)
			
//			try container.encode(self.lineno, forKey: .lineno)
//			try container.encode(self.end_lineno, forKey: .end_lineno)
//			try container.encode(self.col_offset, forKey: .col_offset)
//			try container.encode(self.end_col_offset, forKey: .end_col_offset)
//			try container.encode(type_comment, forKey: .type_comment)
		}
	}
}

extension AST.Arguments: IteratorProtocol, Sequence {
	public mutating func next() -> AST.Arg? {
		nil
	}
	
	public typealias Element = AST.Arg
	
	
}
