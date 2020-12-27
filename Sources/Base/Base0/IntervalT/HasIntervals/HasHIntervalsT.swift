

public protocol HasHIntervalsT: HasIntervalsT, HasHIntervalTypeT {}

public extension HasHIntervalsT {
    //typealias U = Interval.U
    
    var startSet: Set<U>? {
        starts?.set
    }
    var endSet: Set<U>? {
        ends?.set
    }
    
    /// unique
    var numStarts: Int {
        startSet?.len ?? 0
    }
    /// unique
    var numEnds: Int {
        endSet?.len ?? 0
    }
    
    
    //MARK: -
    
    /// All intervals have the same start
    var haveTheSameStart: Bool {
        guard let a = intervals?.first else {
            return false
        }
        return intervals?.allSatisfy{$0.start == a.start} == true
    }
    /// All intervals have the same end
    var haveTheSameEnd: Bool {
        guard let a = intervals?.first else {
            return false
        }
        return intervals?.allSatisfy{$0.end == a.end} == true
    }
    /// All intervals have the same start and end
    var haveTheSameStartAndEnd: Bool {
        guard let a = intervals?.first else {
            return false
        }
        return intervals?.allSatisfy{$0.start == a.start && $0.end == a.end} == true
    }
    
    //MARK: -
    
    /// intervals sharing the same start
    func intervalsWith(start: U) -> Set<I>? {
        intervals?.filter{$0.start == start}.sth?.set
    }
    
    /// intervals sharing the same end
    func intervalsWith(end: U) -> Set<I>? {
        intervals?.filter{$0.end == end}.sth?.set
    }
    
    /// intervals sharing the same start
    func intervalsWith(start: U, end: U) -> Set<I>? {
        intervals?.filter{$0.start == start && $0.end == end}.sth?.set
    }
    
    //MARK: -
    
    
    /// number of intervals sharing the same start
    var intervalsWithSharedStarts: [Set<I>]? {
        intervals?.grouped(with: { $0.start == $1.start })?.sets
    }
    
    /// number of intervals sharing the same start
    var intervalsWithSharedEnds: [Set<I>]? {
        intervals?.grouped(with: { $0.end == $1.end })?.sets
    }
    
    
    /// number of intervals sharing the same start
    var maxNumOfSharedStarts: Int {
        intervalsWithSharedStarts?.maxCount ?? 0
    }
    
    /// number of intervals sharing the same end
    var maxNumOfSharedEnds: Int {
        intervalsWithSharedEnds?.maxCount ?? 0
    }
    
    
    /// if not empty
    var unitsWithMaxSharedStarts: [Self]? {
        L.notImpl()
    }
    /// if not empty
    var unitsWithMaxSharedEnds: [Self]? {
        L.notImpl()
    }
    
    //MARK: -
    
    
    var isTree: Bool {
        haveTheSameStart && maxNumOfSharedEnds == 2 // && maxNumOfSharedStarts == 4
    }
    
    
    /// All intervals have the same end
    //    func startsHave(maxNumEnds: Int) -> Bool {
    //        guard let a = intervals.first else {
    //            return false
    //        }
    //        return intervals?.allSatisfy{$0.end == a}
    //    }
    
    //TODO: ? reverses all intervals
    //func reversed() ->Self
}



