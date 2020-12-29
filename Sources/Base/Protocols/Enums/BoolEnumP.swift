


// used for binary logic, like parent - child
public protocol BoolEnumP: HasDescrP {
    
    var rawValue: Bool {get}
    init?(rawValue: Bool)
}
public extension BoolEnumP {

    var int: Int {
        rawValue ? 1 : -1
    }
    var descr: Str {
        Str(describing: self) + ": \(rawValue)"
    }
}
public extension BoolEnumP where Self: Comparable {
    static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.int < rhs.int
    }
}

//MARK: -

public protocol BoolEnumT: BoolEnumP, Comparable, CaseIterable {}

public extension BoolEnumT {
    
    static var randomCase: Self {
        Array(allCases)[Int(booleanLiteral: Bool.random())]
    }
    var antonym: Self {
        Self(rawValue: !rawValue)!
    }
}


