


public protocol CanSatisfyP {
    typealias VoidCond = () -> Bool
    
    func satisfies(_ cond: VoidCond) -> Bool
    
    // OR 
    //func satisfies<T>(_ cond: (T) -> Bool) -> Bool
}


public extension Array where Element: CanSatisfyP {
    
    /// true if allSatisfy, if empty returns true
    func satisfy(_ cond: @escaping VoidCond) -> Bool {
        allSatisfy{$0.satisfies(cond)}
    }
}

public extension Set where Element: CanSatisfyP {
    
    /// true if allSatisfy, if empty returns true
    func satisfy(_ cond: @escaping VoidCond) -> Bool {
        allSatisfy{$0.satisfies(cond)}
    }
}


