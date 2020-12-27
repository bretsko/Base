
// Swift protocol
public protocol HasElementTypeT {
    associatedtype Element //: HasDescrP
    typealias E = Element
}
public extension HasElementTypeT {
    typealias BoolCond = (E) -> Bool
    typealias VoidCond = () -> Bool
    typealias VoidBlock = (E) -> Void
}


public protocol HasEquatableElementT: HasElementTypeT where Element: Equatable {
    
}
public protocol HasHashableElementT: HasEquatableElementT where Element: Hashable {
    
}


public protocol HasComparableElementT: HasElementTypeT where Element: Comparable {
    
}

public protocol HasHashableComparableElementT: HasHashableElementT where Element: Comparable {
    
}

//
extension Set: HasHashableElementT {} //SwiftHashableListT

