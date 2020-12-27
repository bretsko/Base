


//@_exported import Log


public typealias CanBeManyOptionalP = CanBeManyP & CanBeOptionalP

// used by reqs to mean the unit is optional
public protocol CanBeOptionalP {
    
    var optional: Bool {get set}
}

public extension Array where Element: CanBeOptionalP {
    
    var optionals: Array? {
         filter{$0.optional}.sth
    }
    var hasOptionals: Bool {
        optionals != nil
    }
    
    /// indices in Array where optional = true
    var optionalIdxs: [Int]? {
        indices(where: {$0.optional})
    }
}

public extension Set where Element: CanBeOptionalP {
    
    var optionals: Set? {
         filter{$0.optional}.sth
    }
    var hasOptionals: Bool {
        optionals != nil
    }
}

