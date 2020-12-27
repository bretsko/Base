

//MARK: - ELimitedT

public protocol ELimitedT: LimitedT, Equatable {}

public extension ELimitedT {
    var isStartState: Bool {
        self == startState
    }
    var isEndState: Bool {
        self == endState
    }
}


public protocol HasELimitedTypeT: HasUnitTypeT where Unit: ELimitedT {}


//MARK: - HLimitedT


/// Obj with limits has one or many start / end states, which serve as boundaries
/// for ex for Int - Int.min, Int.max
/// MStep can move in 2 directions, and can count distance (between states), compare mstepSets!
public protocol HLimitedT: ELimitedT, Hashable {}


public protocol HasHLimitedTypeT: HasUnitTypeT where Unit: HLimitedT {}



//MARK: -


extension Int: HLimitedT {}
public extension Int {
    
    //???
    static var startState: Int {
        .min
    }
    static var endState: Int {
        .max
    }
}



extension Double: HLimitedT {}
public extension Double {
    
    //???
    static var startState: Double {
        .min
    }
    static var endState: Double {
        .max
    }
}



//
//
//extension Bool: HLimitedT {}
//public extension Bool {
//
//    //???
//    static var startState: Bool {
//        return false
//    }
//    static var endState: Bool {
//        return true
//    }
//}
//
