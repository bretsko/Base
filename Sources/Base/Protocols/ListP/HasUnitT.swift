

public typealias EUnitT = HasDescrP & Equatable
public typealias HUnitT = HasDescrP & Hashable


//MARK: - HasUnitTypeT

public protocol HasUnitTypeT {
    associatedtype Unit: HasDescrP
    typealias U = Unit
}


public protocol HasEUnitTypeT: HasUnitTypeT where Unit: Equatable {}

public protocol HasHUnitTypeT: HasEUnitTypeT where Unit: Hashable {}


public protocol HasComparableUnitT: HasUnitTypeT where Unit: Comparable {}

public protocol HasHashableComparableUnitT: HasHUnitTypeT, HasComparableUnitT {}


//MARK: - HasUnitT

public protocol HasUnitT: HasUnitTypeT {
    
    var unit: U {get}
}

public protocol HasEUnitT: HasUnitT, HasEUnitTypeT {}
public protocol HasHUnitT: HasUnitT, HasHUnitTypeT {}


//public extension Array where Element: HasUnitT {
//    var units: [E.U] {
//        return map{$0.unit}
//    }
//}


//MARK: - HasObjT


public protocol HasObjT {
    associatedtype ObjT
    
    var obj: ObjT {get}
}

public protocol HasMutObjT: HasObjT {
    
    var obj: ObjT {get set}
}

public extension Array where Element: HasObjT {
    typealias ObjT = E.ObjT
    
    var objs: [ObjT] {
        return map{$0.obj}
    }
}
public extension Set where Element: HasObjT {
    typealias ObjT = E.ObjT
    
    var objs: [ObjT] {
        return map{$0.obj}
    }
}
