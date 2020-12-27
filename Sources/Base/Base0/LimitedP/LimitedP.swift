

/// Obj with limits has one or many start / end states, which serve as boundaries
/// for ex for Int - Int.min, Int.max
/// MStep can move in 2 directions, and can count distance (between states), compare mstepSets!
public protocol LimitedT { //SortableP ??
    static var startState: Self {get}
    static var endState: Self {get} // endState.follows(startState)
}
// can be regarded as IntervalT

public extension LimitedT {
    var startState: Self {
        Self.startState
    }
    var endState: Self {
        Self.endState
    }
}

public protocol HasLimitedTypeT: HasUnitTypeT where Unit: LimitedT {}

//MARK: -

/// Obj with many limits has many start / end states, which serve as boundaries
/// for ex for Int - Int.min, Int.max
/// MStep can move in 2 directions, and can count distance (between states), compare mstepSets!
//public protocol HasManyLimitsP {
//    var startStates: [Self] {get}
//    var endStates: [Self] {get}
//}



//MARK: -

/// Obj with limits has one or many start / end states, which serve as boundaries
/// for ex for Int - Int.min, Int.max
/// MStep can move in 2 directions, and can count distance (between states), compare mstepSets!
public protocol SortableLimitedT: LimitedT, SortableP {}


//public protocol HasHLimitedTypeT: HasUnitTypeT {
//    associatedtype Unit: HLimitedT
//}


//public protocol MeasurableLimitedT: LimitedT, ScoreCmpT {}
public extension LimitedT where Self: ScoreCmpT {
    
    static var length: Double {
        Self.compare(Self.startState, Self.endState)
    }
}
