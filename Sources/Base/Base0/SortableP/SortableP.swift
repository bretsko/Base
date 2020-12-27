


/// like Comparable, but has special logic
public protocol SortableP {
    
    //TODO: consider returning false
    /// returns false if the states are equal
    func follows(_ other: Self) -> Bool
}

public extension SortableP {
    
    func precedes(_ other: Self) -> Bool {
        other.follows(self)
    }
    
    /// returns false if any of the states are equal
    func isBetween(_ start: Self,
                   and end: Self) -> Bool {
        self.follows(start) && self.precedes(end)
    }
    
    
    func follows(others: [Self]) -> Bool {
        others.allSatisfy{ self.follows($0) }
    }
    func precedes(others: [Self]) -> Bool {
        others.allSatisfy{ self.precedes($0) }
    }
}


public protocol HasSortableTypeT: HasUnitTypeT where Unit: SortableP {}



public protocol ESortableT: SortableP, Equatable {}

public protocol HSortableT: ESortableT, Hashable {}




// maybe a bad idea, may remove later
public extension SortableP where Self: Comparable {
    func follows(_ other: Self) -> Bool {
        self > other
    }
}
