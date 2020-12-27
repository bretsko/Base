


public protocol ReversibleP {
    
    // DONT MAKE VAR -> CANNOT USE AS PROTOCOL
    // if Self is returned from function - can use in P protocols !! but if it's var  - NOT !
    func reversed() -> Self
}

public extension ReversibleP where Self: Equatable {
    func isReversed(of obj: Self) -> Bool {
        reversed() == obj
    }
}


public protocol Reversible_P {
    
    func reversed() -> Self?
}
public extension Reversible_P {
    var hasReversed: Bool {
        reversed() != nil
    }
}


//MARK: - 


public extension Array where Element: ReversibleP {
    
    /// returns reversed for each of [ReversibleP]
    func reversed() -> Self {
        map{$0.reversed()}
    }
}
public extension Array where Element: ReversibleP & Equatable {
    func isReversed(of units: [E]) -> Bool {
        reversed() == units
    }
}

public extension Set where Element: ReversibleP {
    
    /// returns reversed for each of [ReversibleP]
    func reversed() -> Self {
        map{$0.reversed()}.set
    }
    
    func isReversed(of units: Set) -> Bool {
        reversed() == units
    }
}

