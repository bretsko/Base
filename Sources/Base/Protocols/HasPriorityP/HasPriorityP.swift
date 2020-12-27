
public protocol HasPriorityP {
    
    /// 0.0 - 1.0
    var priority: Double {get}
}

public extension HasPriorityP {
    
    var hasMaxPriority: Bool {
        priority == 1.0
    }
    var hasMinPriority: Bool {
        priority == 0.0
    }
    
    func hasMorePriority(than other: Self) -> Bool {
        priority > other.priority
    }
    func hasLessPriority(than other: Self) -> Bool {
        priority < other.priority
    }
    func hasEqualPriority(as other: Self) -> Bool {
        priority == other.priority
    }
}

public protocol PriorityComparableT: HasPriorityP, Comparable {}
public extension PriorityComparableT {
    static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.priority < rhs.priority
    }
}


func isValidPriority(_ num: Double) -> Bool {
    num >= 0.0 && num <= 1.0
}
