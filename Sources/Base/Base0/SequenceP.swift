

/// or ArrayP
public protocol SequenceP: ListP, ReversibleP {
    
    //TODO: many, all, some, no, etc
    func contains(_ other: Self) -> Bool
    
    func has(suffix other: Self) -> Bool
    
    func has(prefix other: Self) -> Bool
}

public extension SequenceP {
    
    func contains(_ others: [Self]) -> Bool {
        others.allSatisfy { contains($0)}
    }
    
    //    func has(suffix others: [Self]) -> Bool
    //    func has(prefix others: [Self]) -> Bool
}


//MARK: -

// or ArrayP
public protocol SequenceT: ListT, SequenceP {} //== HasElementTypeT, Measurable
//TODO: ext with funcs - contains obj, prefix, etc

// or ArrayP
public protocol MutSequenceT: SequenceT, MutSequenceP {}
//TODO: ext with funcs to add, insert, remove obj, etc



//MARK: -

/// or ArrayP
public protocol MutSequenceP: SequenceP {
    
    mutating func append(_ other: Self)
    mutating func prepend(_ other: Self)
}

public extension MutSequenceP {
    
    /// if cannot append - fails, and returns false
    mutating func append(_ others: [Self]) {
        others.forEach { append($0) }
    }
    
    /// if cannot append - fails, and returns false
    mutating func prepend(_ others: [Self]) {
        others.reversed().forEach { prepend($0) }
    }
}


