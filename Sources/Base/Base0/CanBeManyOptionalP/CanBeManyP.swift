



// used by reqs to mean unit can repeat many times
public protocol CanBeManyP {
    
    var canBeMany: Bool {get set}
}


public extension Array where Element: CanBeManyP {
    
    var canBeManys: Array? {
        filter{$0.canBeMany}.sth
    }
    var hasCanBeManys: Bool {
        canBeManys != nil
    }
    
    /// indices in Array where canBeMany = true
    var canBeManyIdxs: [Int]? {
        indices(where: {$0.canBeMany})
    }
}

public extension Set where Element: CanBeManyP {
    
    var canBeManys: Set? {
         filter{$0.canBeMany}.sth
    }
    var hasCanBeManys: Bool {
        canBeManys != nil
    }
}




