


public protocol EUnitArrayT: UnitArrayT, HasELUnitTypeT {}

public extension EUnitArrayT {
    
    func contains(_ other: Self) -> Bool {
        units.contains(other.units)
    }
    func containsAll(_ other: Self) -> Bool{
        units.contains(all: other.units)
    }
    //TODO: many, all, some, no, etc
    
    func has(suffix other: Self) -> Bool {
        units.has(suffix: other.units)
    }
    func has(prefix other: Self) -> Bool {
        units.has(prefix: other.units)
    }
    
    //MARK: many
}


public protocol HUnitArrayT: EUnitArrayT, HasHLUnitTypeT, Hashable {}

//public extension HUnitArrayT {
//    //TODO: Set funcs
//}


