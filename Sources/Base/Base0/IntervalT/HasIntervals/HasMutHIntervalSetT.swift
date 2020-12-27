

public protocol HasMutHIntervalSetT: HasHIntervalsT {
    
    typealias SetType = Set<Interval>
    
    var iset: SetType {get set}
}
public extension HasMutHIntervalSetT {
    //typealias U = Interval.U
    
    // HasHIntervalsT
    var intervals: [Interval]? {
        iset.array
    }
}

