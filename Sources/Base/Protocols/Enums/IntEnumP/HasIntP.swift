


public protocol HasIntP {
    var int: Int {get}
}

public protocol HasMutIntP: HasIntP {
    
    var int: Int {get set}
}


public protocol IntHashableT: HasIntP, Hashable {}

public extension IntHashableT {
    func hash(into hasher: inout Hasher) {
        hasher.combine(int)
    }
}

public protocol IntComparableT: HasIntP, Comparable {}

public extension IntComparableT {
    static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.int < rhs.int
    }
}


//MARK: -

public extension Array where Element: HasIntP {
    
    var ints: [Int] {
        map{$0.int}
    }
}

// used by Int enums
public protocol HasStaticIntsP {
    
    static var ints: [Int] {get}
}

//public extension Set where Element: HasIntP {
//    
//    var ints: [Int] {
//        return array.ints
//    }
//}


