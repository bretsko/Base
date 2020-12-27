


// used by MeasurableIntervalT

/// Measurable
public protocol HasLengthP {
    /// > 0
    var length: Double {get}
}

public extension HasLengthP {
    
    var hasMinLength: Bool {
        length == 0.0
    }
    func isLonger(than other: Self) -> Bool {
        length > other.length
    }
    func isShorter(than other: Self) -> Bool {
        other.length < length
    }
    func isEquallyLong(as other: Self) -> Bool {
        length == other.length
    }
}


public protocol HasMeasurableTypeT: HasUnitTypeT where Unit: HasLengthP {}

/// length comparable
public protocol LengthComparableT: HasLengthP, Comparable {}
public extension LengthComparableT {
    static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.length < rhs.length
    }
}



public func isValidLength(_ num: Double) -> Bool {
    num >= 0.0 && num <= 1.0
}


//TODO:
//public extension Array where Element: HasLengthP {
//
//    /// filter {$0.length == length}
//    func filter(with length: Int) -> Array {
//        filter {$0.length == length}
//    }
//    /// filter {$0.length != length}
//    func filter(without length: Int) -> Array {
//        filter {$0.length != length}
//    }
//}
//
//
//public extension Set where Element: HasLengthP {
//
//    /// filter {$0.length == length}
//    func filter(with length: Int) -> Set {
//        filter {$0.length == length}.set
//    }
//    /// filter {$0.length != length}
//    func filter(without length: Int) -> Set {
//        filter {$0.length != length}
//    }
//}

