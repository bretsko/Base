

// Interval with distance between start and end which can be measured
public protocol MeasurableIntervalT: IntervalT, HasScoreCmpTypeT, LengthComparableT {}

public extension MeasurableIntervalT {
    
    var length: Double { // LengthCmpT
        return Unit.compare(start, end)
    }
}




