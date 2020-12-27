
public protocol HasIntervalsT: HasIntervalTypeT {
    
    var intervals: [Interval]? {get}
}
public extension HasIntervalsT {
    
    var starts: [U]? {
        intervals?.starts
    }
    var ends: [U]? {
        intervals?.ends
    }
    
    /// counts number of diff starts
    var numStarts: Int {
        starts?.len ?? 0
    }
    
    /// counts number of diff ends
    var numEnds: Int {
        ends?.len ?? 0
    }
}
