

/// a type which can be represented with single unique String
public protocol HasStrKeyP {
    
    /// unique string key, used for hashing and comparing
    var skey: Str {get}
}

//StrKeyHashableAndEquatableT ?
public protocol StrKeyHashableAndEquatableT: HasStrKeyP, Hashable {}
public extension StrKeyHashableAndEquatableT {

    func hash(into hasher: inout Hasher) {
        hasher.combine(skey)
    }
    // test this
//    static func == (lhs: Self, rhs: Self) -> Bool {
//        return lhs.skey == lhs.skey
//    }
}


//public protocol StrKeyComparableT: HasStrKeyP, Comparable {}
//public extension StrKeyComparableT {
//    static func < (lhs: Self, rhs: Self) -> Bool {
//        return lhs.skey < rhs.skey
//    }
//}


//MARK: -

public extension Array where Element: HasStrKeyP {
    
    var skeys: [Str] {
        return map{$0.skey}
    }
}
