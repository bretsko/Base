

public protocol UnitArrayT: ListT { //try add Collection
    
    var units: [LU] {get}
}
public extension UnitArrayT {
    
    // ListP
    var count: Int {
        units.len
    }
    
    var center: LU? {
        guard hasSth else {
            return nil
        }
        return units[Swift.max(round(len.d / 2).l - 1, 0)]
    }
    var first: LU? {
        units.first
    }
    var last: LU? {
        units.last
    }
    
    //TODO: more - enumerated, forEach, allSatisfy, has, contains, Set funcs etc
}





public extension Array where Element: UnitArrayT {
    var units: [E.LU] {
        map{$0.units}.flatMap{$0}
    }
}

public extension Set where Element: UnitArrayT {
    var units: [E.LU] {
        array.units
    }
}


//
//
//
//public struct UnitArrayG<T: HasDescrP>: UnitArrayT { //try add Collection
//    public var units: [T]
//}
//public extension UnitArrayG {
//    typealias LUnit = T
//
//    init(_ units: [T]) {
//        self.units = units
//    }
//}
//
