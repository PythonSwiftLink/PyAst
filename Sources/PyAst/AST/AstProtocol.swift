
import Foundation



public protocol AstProtocol: Codable {
	var lineno: Int { get set }
	var col_offset: Int { get set }
	
	var end_lineno: Int? { get }
	var end_col_offset: Int? { get }
	var type_comment: String? { get }
	
	var name: String { get }
}


//public enum AstType: String, Codable {
//	case ImportFrom
//	case Module
//	case FunctionDef
//	case ClassDef
//	case Call
//	case Slice
//	case Subscript
//	
//	case Annotation
//	case Expr
//	case Keyword = "keyword"
//	case Constant
//	
//	case Name
//	case Assign
//	case AnnAssign
//	
//	case Arg
//	case Tuple
//	case List
//	case Dict
//	case With
//	case WithItem
//	
//	case Str
//	
//	case Pass
//	
//}
