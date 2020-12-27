

// between 2 obj states
public protocol IntervalT: HasUnitTypeT {
    var start: U {get}
    var end: U {get}
}

//TODO: consider impl IntervalG

public protocol EIntervalT: IntervalT, HasEUnitTypeT, Equatable {}
public extension EIntervalT {
    /// means start == end
    var isZeroInterval: Bool {
        start == end
    }
    //TODO: uniques, etc
}

public protocol HIntervalT: EIntervalT, HasHUnitTypeT, Hashable {}

//public extension HIntervalT {}
//TODO: Set funcs, etc


public protocol CmpIntervalT: EIntervalT, HasComparableTUnitT {} //Hashable

//public extension CmpIntervalT {}
//TODO: Set funcs, etc

//ComparableT



public protocol HasIntervalTypeT: HasUnitTypeT where Unit == Interval.Unit {
    associatedtype Interval: IntervalT
    typealias I = Interval
    
    
}

public protocol HasHIntervalTypeT: HasIntervalTypeT where Interval: HIntervalT {}
