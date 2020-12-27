
//

// used in reqs
public protocol CanBeSatisfiedP {
    var isSatisfied: Bool {get}
}

// used in reqs
public protocol CanBeMutSatisfiedP: CanBeSatisfiedP {
    var isSatisfied: Bool {get set}
}
public extension CanBeMutSatisfiedP {
    
    mutating func setSatisfied() {
        isSatisfied = true
    }
    mutating func setNotSatisfied() {
        isSatisfied = false
    }
}



public extension Array where Element: CanBeSatisfiedP {
    
    /// if empty returns false
    var isSatisfied: Bool {
        allSatisfy{$0.isSatisfied}
    }
    //    var hasSatisfied: Bool {
    //         has{$0.isSatisfied}
    //    }
}

public extension Set where Element: CanBeSatisfiedP {
    
    /// if empty returns false
    var isSatisfied: Bool {
        allSatisfy{$0.isSatisfied}
    }
}

public extension Array where Element == CanBeSatisfiedP {
    
    /// if empty returns false
    var isSatisfied: Bool {
        allSatisfy{$0.isSatisfied}
    }
}





