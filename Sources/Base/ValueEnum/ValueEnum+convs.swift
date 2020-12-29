

public extension ValueEnum {
    
    var _bool: Bool? {
        switch self {
        case .bool(let a):
            return a
        default:
            return nil
        }
    }
    var _int: Int? {
        switch self {
        case .int(let a):
            return a
        default:
            return nil
        }
    }
    var _str: Str? {
        switch self {
        case .str(let a):
            return a
        default:
            return nil
        }
    }
    var _double: Double? {
        switch self {
        case .double(let a):
            return a
        default:
            return nil
        }
    }
    
    var _char: Char? {
        switch self {
        case .char(let a):
            return a
        default:
            return nil
        }
    }
    var _rng: Rng? {
        switch self {
        case .rng(let a):
            return a
        default:
            return nil
        }
    }  
    
//    // optionals
//    var _bool_op: Bool? {
//        switch self {
//        case .bool_op(let a):
//            return a
//        default:
//            return nil
//        }
//    }
//    var _int_op: Int? {
//        switch self {
//        case .int_op(let a):
//            return a
//        default:
//            return nil
//        }
//    }
//    var _str_op: Str? {
//        switch self {
//        case .str_op(let a):
//            return a
//        default:
//            return nil
//        }
//    }
//    var _double_op: Double? {
//        switch self {
//        case .double_op(let a):
//            return a
//        default:
//            return nil
//        }
//    }
//    
//    //MARK: -
//    
//    var isTrue: Bool {
//        if let a = _bool {
//            return a == true
//        } else if let a = _bool_op {
//            return a == true
//        }
//        return false
//    }   
//    /// conv getter from 2 cases
//    var _int_any: Int? {
//        if let a = _int {
//            return a
//        } else if let a = _int_op {
//            return a
//        }
//        return nil
//    }
//    /// conv getter from 2 cases
//    var _str_any: Str? {
//        if let a = _str {
//            return a
//        } else if let a = _str_op {
//            return a
//        }
//        return nil
//    }
//    /// conv getter from 2 cases
//    var _double_any: Double? {
//        if let a = _double {
//            return a
//        } else if let a = _double_op {
//            return a
//        }
//        return nil
//    }
}
