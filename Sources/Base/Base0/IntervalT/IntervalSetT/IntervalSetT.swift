


//TODO: Graph, Tree, Set interfaces and impl
public protocol IntervalSetT: MutHUnitSetT, HasMutHIntervalSetT where LUnit == Interval {
    
    //init(_ iset: SetType)
}
public extension IntervalSetT {
    
//    init(_ intervals: [Interval] = []) {
//        self.init(Set(intervals))
//    }
//    init(_ interval: Interval) {
//        self.init([interval])
//    }
    
    //MutHUnitSetT
    var uset: Set<LU> {
        get {
            iset
        }
        set {
            iset = newValue
        }
    }
}

//not very useful, because I want to combine diff types of sets in one model
//public protocol HasIntervalSetTypeT: HasIntervalTypeT {
//    associatedtype IntervalSet: IntervalSetT
//    
//    typealias Interval = IntervalSet.Interval
//}


// + WEGraph
//public extension IntervalSetT where Interval: ScorableP {
//    typealias G = WEGraph<Interval.U>
//
//    /// returns nil if empty
//    var wegraph: G? {
//        L.notImpl()
//                // return intervals?.wegraph
//
//
//        //        get {
//        //            return intervals?.wegraph
//        //        }
//        //        set {
//        //            guard let edges = newValue?.allEdges else {
//        //                return
//        //            }
//        //            edges.forEach { e in
//        //                //! need mpath
//        //                let mint = Interval(MPathT, e.from)
//        //                intervals?.append(mint)
//        //            }
//        //        }
//    }
//}
