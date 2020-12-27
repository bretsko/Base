


public protocol ScorableP {
    var score: Double {get}
}


//public extension Array where Element: ScorableP {
//
//    var scores: [Double] {
//        map{$0.score}
//    }
//}

///?? Score Comparable
//public protocol ScoreCmpT: ScorableP, Comparable {}
//public extension ScoreCmpT {
//    // Comparable
//    static func < (lhs: Self, rhs: Self) -> Bool {
//        return lhs.score < rhs.score
//    }
//}


// + wegraph
//public extension Array where Element: EIntervalT & ScorableP {
//    typealias G = WEGraph<E.U>
//    typealias VType = G.VType
//    typealias EType = G.EType
//
//    /// ScorableP graph
//    var wegraph: G? {
//
//        let verts = allUnits
//        guard verts.hasSth else {
//            return nil
//        }
//
//        var g = G(verts)
//        forEach {
//            g.add(from: $0.start, to: $0.end, weight: $0.score, directed: true)
//        }
//        return g
//    }
//
//
//    /// returns edges which repr the shortest path
//    func shortestPath(from: VType,
//                      to: VType) -> [EType]? {
//        return wegraph?.shortestPath(from: from, to: to)
//    }
//
//    func shortestPaths(from: VType,
//                       to: [VType]) -> [[EType]]? {
//
//        return wegraph?.shortestPaths(from: from, to: to)
//    }
//
//    func findSortedPaths(from: VType,
//                         to: VType,
//                         numPaths: Int? = nil) -> [[EType]]? {
//        return wegraph?.findSortedPaths(from: from,
//                                        to: to,
//                                        numPaths: numPaths)
//    }
//
//    /// returns dict with shortest distances to each vertex
//    func shortestDistances(from: VType,
//                           to: VType) -> [Double]? {
//
//        return wegraph?.shortestDistances(from: from,
//                                          to: to)
//    }
//
//    /// returns false if empty
//    func shortestDistance(from: VType,
//                          to: VType,
//                          isMoreThan d: Double) -> Bool {
//        return wegraph?.shortestDistance(from: from,
//                                         to: to,
//                                         isMoreThan: d) ?? false
//    }
//
//    /// returns false if empty
//    func shortestDistance(from: VType,
//                          to: VType,
//                          isLessThan d: Double) -> Bool {
//        return wegraph?.shortestDistance(from: from,
//                                         to: to,
//                                         isLessThan: d) ?? false
//    }
//
//    //TODO:
//    // shortest distance from,to is more/less/equal than
//    // contains path with distance more than from, to -> Bool
//    // shortest path from,to goes via -> Bool
//}
//
//
////TODO:
////public extension Array where Element: HIntervalT & ScorableP, VType: Hashable {
////
////    /// returns dict with shortest distances to each vertex
////    func getVertext2DistanceDict(from: VType,
////                                 to: VType) -> [VType: Double]? {
////        return wegraph?.getVertext2DistanceDict(from: from,
////                                                to: to)
////    }
////}
//
//
/////?? Score Comparable
////public protocol ScoreCmpT: ScorableP, Comparable {}
////public extension ScoreCmpT {
////    // Comparable
////    static func < (lhs: Self, rhs: Self) -> Bool {
////        return lhs.score < rhs.score
////    }
////}
