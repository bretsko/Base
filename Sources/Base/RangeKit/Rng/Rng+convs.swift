




public extension Rng {
    
    // uses current rng to make a new one
    
    func range(withIdxsMoreThan idx: Int,
               includingIt: Bool = false) -> Rng? {
        
        guard let idxs = getIndexes(moreThan: idx,
                                    includingIt: includingIt) else {
            return nil
        }
        return Rng(idxs)
    }
    
    func range(withIdxsLessThan idx: Int,
               includingIt: Bool = false) -> Rng? {
        
        guard let idxs = getIndexes(lessThan: idx,
                                    includingIt: includingIt) else {
            return nil
        }
        return Rng(idxs)
    }
    
    func range(from idx1: Int,
               to idx2: Int,
               includingBoth: Bool = false) -> Rng? {
        
        guard let _ = getIndexes(from: idx1,
                                 to: idx2,
                                 includingBoth: includingBoth) else {
            return nil
        }
        return Rng(idx1, idx2)
    }
}




//public extension Rng {
//
//?

//    func reversed() -> Self {
//        switch self {
//        case .idxSet(let idxSet):
//            return Rng(idxSet.reversed())
//        case .rng(let from, let to):
//            return Rng(to, from)
//        }
//    }
//    var range_indexes_reversed: [Int] {
//        return indexes_reversed
//    }
//    /// from...to
//    var range_indexes: [Int] {
//        return indexes
//    }
//    /// from...to
//    var range_indexSet: Set<Int> {
//        return idxSet
//    }
//
//    var indexes_reversed: [Int] {
//        return indexes.reversed()
//    }
//
//    //TODO: consider renaming to union
//    /// if supplied indices are wider in any direction, they override the old indices
//    @discardableResult
//    mutating func merge(with rng: Rng) -> Bool {
//        guard rng.from < from || rng.to > to else {
//            return false
//        }
//        if rng.from < from {
//            from = rng.from
//        }
//        if rng.to > to {
//            to = rng.to
//        }
//        return true
//    }
//
//    /// returns new rng, merged with the target one, if it's possible
//    func merged(with rng: Rng) -> Rng? {
//        var a = self
//        if a.merge(with: rng) {
//            return a
//        }
//        return nil
//    }
//
//
//    /// if includingEnds is false, excludes ends
//    func isInRange(from: Int, to: Int,
//                   includingEnds: Bool = true) -> Bool {
//        if includingEnds {
//            return self.from >= from && self.to <= to
//        } else {
//            return self.from > from && self.to < to
//        }
//    }
//    func isOutsideRange(from: Int, to: Int) -> Bool {
//        return Set(from...to).isDisjoint(with: idxSet)
//    }
//    func containsRange(from: Int, to: Int,
//                       includingEnds: Bool = true) -> Bool {
//        L.notImpl()
//        //return !isOutsideRange(from: from, to: to,includingEnds:includingEnds)
//        //!Set(from...to).intersection(idxSet).isEmpty
//        //isInRange(from: from, to: to) ||
//    }
//
//
//    //MARK: index
//
//    /// means idx is between from and to
//    func hasInside(_ idx: Int,
//                   includingEnds: Bool = true) -> Bool {
//        if includingEnds {
//            return idx >= from || idx <= to
//        } else {
//            return idx > from || idx < to
//        }
//    }
//
//    /// means idx is bigger than to or less than from
//    func hasOutside(_ idx: Int) -> Bool {
//        return idx < from || idx > to
//    }
//
//
//    //MARK: index set
//
//    /// means all given idxs are outside
//    func hasOutside(_ idxs: Set<Int>) -> Bool {
//        return idxSet.isDisjoint(with: idxs)
//    }
//
//
//    /// = hasSomeInside
//    func contains(some idxs: Set<Int>) -> Bool {
//        return hasSomeInside(idxs)
//    }
//    /// means all given idxs are inside
//    func hasSomeInside(_ idxs: Set<Int>) -> Bool {
//        return !idxSet.isDisjoint(with: idxs)
//        //!idxSet.intersection(idxs).isEmpty
//    }
//
//    /// = hasAllInside
//    func containsAll(_ idxs: Set<Int>) -> Bool {
//        return hasAllInside(idxs)
//    }
//    /// means all given idxs are inside
//    func hasAllInside(_ idxs: Set<Int>) -> Bool {
//        return idxSet.isSuperset(of: idxs)
//        //!idxSet.intersection(idxs).isEmpty
//    }
//
//
//    /// means given idxs contain all indices
//    func isPartOf(_ idxs: Set<Int>) -> Bool {
//        return idxSet.isSubset(of: idxs)
//    }
//
//
//    //MARK: index array
//
//
//    /// means all given idxs are outside
//    func hasOutside(_ idxs: [Int]) -> Bool {
//        return hasOutside(Set(idxs))
//    }
//
//    /// = hasSomeInside
//    func contains(some idxs: [Int]) -> Bool {
//        return containsSome(Set(idxs))
//    }
//    /// means all given idxs are inside
//    func hasSomeInside(_ idxs: [Int]) -> Bool {
//        return hasSomeInside(Set(idxs))
//    }
//
//    /// = hasAllInside
//    func containsAll(_ idxs: [Int]) -> Bool {
//        return containsAll(Set(idxs))
//    }
//    /// means all given idxs are inside
//    func hasAllInside(_ idxs: [Int]) -> Bool {
//        return hasAllInside(Set(idxs))
//    }
//
//    /// means given idxs contain all indices
//    func isPartOf(_ idxs: [Int]) -> Bool {
//        return isPartOf(Set(idxs))
//    }
//}
//
//



//public protocol MutRngP: RngP {
//
//    var from: Int {get set}
//    var to: Int {get set}
//
//    // if supplied indices are wider in any direction, they override the old indices
//    @discardableResult
//    mutating func merge(with rng: Rng) -> Bool
//
//    /// returns new rng, merged with the target one, if it's possible
//    func merged(with rng: Rng) -> Rng?
//}

