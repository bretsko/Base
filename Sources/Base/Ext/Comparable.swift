



public extension Comparable {
    
    ///    1.isBetween(5...7) // false
    func isInRange(_ range: ClosedRange<Self>) -> Bool {
         range ~= self
    }
    
    /// returns the current value bounded between a minimum and maximum value
    func limited(_ min: Self, _ max: Self) -> Self {
        var a = self
        a.limit(min: min, max: max)
        return a
    }
    
    /// Bound self between a minimum and maximum value, in place
    mutating func limit(min: Self, max: Self) {
        self = Swift.max(Swift.min(self, max), min)
    }
}


//MARK: -

public func < <T: Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l < r
    case (nil, _?):
        return true
    default:
        return false
    }
}

public func > <T: Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l > r
    default:
        return rhs < lhs
    }
}
