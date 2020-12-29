

public typealias ID = Str
public typealias IDSet = Set<ID>


public protocol HasIDP {
    var idd: ID {get}
}
public extension HasIDP {
    var id: ID {
        idd
    }
}


public protocol HasMutIDP: HasIDP {
    var idd: ID {get set}
}

/// Can only be used as convenience (for rapid dev), unfortunately, compiler gives error when importing class with such conformance from other lib
public protocol IdHashableT: Hashable, HasIDP {}
public extension IdHashableT {
    func hash(into hasher: inout Hasher) {
        hasher.combine(idd)
    }
}


//TODO:
//public extension Array where Element: IdHashableT {
//}
//public extension Set where Element: IdHashableT {
//}


public extension HasIDP {
    static func ==(lhs: Self, rhs: Self) -> Bool {
        lhs.idd == rhs.idd
    }
}

/// Can only be used as convenience (for rapid dev), unfortunately, compiler gives error when importing class with such conformance from other lib
public extension HasIDP where Self: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(idd)
    }
}

//extension ID: HasIDP {
//    public var idd: ID {
//        return self
//    }
//}


//MARK: -


public protocol ObjP: AnyObject, HasIDP {}
public protocol ObjT: ObjP, IdHashableT {}

