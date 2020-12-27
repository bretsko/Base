


public protocol HasIdx_P {
    
    var idx: Int? {get}
}
public extension HasIdx_P {
    
    /// idx != nil
    var hasIndex: Bool {
        idx != nil
    }
}


public extension HasIdx_P {
    
    /// if idx is nil, adds 1 and returns result
    func nextIdx() -> Int? {
        if let i = idx {
            return i + 1
        }
        return nil
    }
    
    /// if idx is nil, subtracts 1 and returns result
    /// if 0 always returns 0
    func prevIdx() -> Int? {
        if let i = idx {
            return i == 0 ? 0 : i - 1
        }
        return nil
    }
}


public protocol HasMutIdx_P: HasIdx_P {
    
    var idx: Int? {get set}
}


//public typealias HasIdx_T = HasIdx_P & IdxHashableT & IdxCmpT












