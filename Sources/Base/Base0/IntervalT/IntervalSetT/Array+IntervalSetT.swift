

public extension Array where Element: IntervalSetT {
    typealias Interval = E.Interval
    typealias IntervalSetType = Set<Interval>
    //typealias U = Interval.U
    
    var isets: [IntervalSetType]? {
         map{$0.iset}.sth
    }
    
    /// all intervals from each Set, if any
    var allIntervals: [Interval]? {
         isets?.flatMap{$0}.sth
    }
    
    var starts: [Interval.U]? {
         allIntervals?.starts
    }
    var ends: [Interval.U]? {
         allIntervals?.ends
    }
    
    //TODO: add, remove containing interval, etc
}


//TODO: bridge via array
//public extension Set where Element: IntervalSetT {
//    //typealias U = Element.U
//    
////    var starts: [U] {
////         map{$0.start}
////    }
////    var ends: [U] {
////         map{$0.end}
////    }
//}


