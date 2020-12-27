

public enum Info: Str, StrEnumT {
    
    case not_implemented = "the code block is not implemented currently"
    
    case not_needed = "not needed"

    /// simple assert for runtime checking of some conditions
    case test_properly = "bug found"
    
    case child_obligation = "all children should implement this"
    
    case wrong_arg_supplied = "wrong arg supplied"
}
  

@inline(__always)
public func uuid() -> Str {
    UUID().uuidString
}







