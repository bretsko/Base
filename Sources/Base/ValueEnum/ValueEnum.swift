


public enum ValueEnum: Hashable, HasDescrP { 
    
    case bool(Bool)
    case int(Int)
    case double(Double)
    case str(Str)
    case char(Char)
    case rng(Rng)
    
    // optionals
//    case bool_op(Bool?)
//    case int_op(Int?)
//    case str_op(Str?)
//    case double_op(Double?)
}

public extension ValueEnum {
    var descr: Str {
        L.notImpl()
    }
}


