

/// adds certain convs if you impl count
public protocol ListP: HasCountP, CanBeEmptyP {}
public extension ListP { //HasCountP where Self: CanBeEmptyP
    // CanBeEmptyP
    var isEmpty: Bool {
        count == 0
    }
}


public protocol HasListUnitTypeT {
    associatedtype LUnit//: HasDescrP
    typealias LU = LUnit
    
    typealias BoolCond = (LU) -> Bool
    typealias VoidCond = () -> Bool
    typealias VoidBlock = (LU) -> Void
}

public protocol HasELUnitTypeT: HasListUnitTypeT where LUnit: Equatable {}
public protocol HasHLUnitTypeT: HasELUnitTypeT where LUnit: Hashable {}

// cannot be applied on top of Collection
/// impl count and get convs
public protocol ListT: ListP, HasListUnitTypeT {}
//public extension ListT {}


public protocol EListT: ListT, HasELUnitTypeT {}
public protocol HListT: ListT, HasHLUnitTypeT {}

