


public protocol HasIdxP {
    
    var idx: Int {get}
}
public protocol HasMutIdxP: HasIdxP {
    
    var idx: Int {get set}
}


public extension HasIdxP {
    
    /// idx == 0
    var isFirst: Bool {
        idx == 0
    }
    
    /// adds one
    func nextIdx() -> Int {
        idx + 1
    }
    
    /// subtracts one, if 0 always returns 0
    func prevIdx() -> Int {
        idx == 0 ? 0 : idx - 1
    }
}

public typealias HasIdxT = HasIdxP & IdxHashableT & IdxCmpT




/// Index Comparable
public protocol IdxCmpT: HasIdxP, Comparable {}
public extension IdxCmpT {
    static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.idx < rhs.idx
    }
}



public protocol IdxHashableT: Hashable, HasIdxP {}
public extension IdxHashableT {
    
    func hash(into h: inout Hasher) {
        h.combine(idx)
    }
}


public typealias IdxMutHashableT = IdxHashableT & HasMutIdxP

//public extension Array where Element: IdxMutHashableT {

// if idx is not provided, uses the nextIdx
/// returns true if added
//    @discardableResult
//    mutating func insert(_ units: [E],
//                         before idx: Int) -> Bool {
//
//        // check if can insert
//        crashIfFalse( units.hasSth,
//                      hasUnit(with: idx) )
//
//        // how to insert?
//        //let units = getUnits(at: [idx])
//
//        fatalError()
//        //        let afterWords = getUnits(after: idx).units
//        //        let beforeWords = getUnits(before: idx).units
//        //
//        //        let all = (beforeWords + units + afterWords).units
//        //        iwSet = Set(all)
//        //        return true
//    }

//TODO:
// if idx is not provided, uses the nextIdx
/// returns true if added
//    @discardableResult
//    mutating func insert(_ units: [E],
//                         after idx: Int) -> Bool {
//
//        // check if can insert
//        crashIfFalse( units.hasSth,
//                      hasUnit(with: idx) )
//
//        fatalError()
//        // how to insert?
//        //        let a = getUnits(before: idx).units
//        //        let b = getUnits(after: idx).units
//        //
//        //        let all = (a + units + b).units
//        //        iwSet = Set(all)
//        //        return true
//
//    }
//
//    // if idx is not provided, uses the nextIdx
//    /// returns true if added
//    @discardableResult
//    mutating func insert(_ units: [E],
//                         indices: [Int]) -> Bool {
//        crashIfNegative(indices)
//
//        crashIfFalse( units.hasSth,
//                      units.len == indices.len )
//
//        var added = 0
//        for i in 0..<indices.len {
//            if insert(units[i], idx: indices[i]) {
//                added += 1
//            }
//        }
//        return added == units.len
//    }
//
//
//    // if idx is not provided, uses the nextIdx
//    /// returns true if added
//    @discardableResult
//    mutating func insert(_ unit: E,
//                         idx: Int? = nil) -> Bool {
//        let i: Int
//        if let idx {
//            crashIfNegative(idx)
//            i = idx
//        } else {
//            i = 0
//        }
//        return iset.insert(Unit(unit, i)).inserted
//    }
//}







//
//
//public protocol IndexedP: HasMutIdxP {
//    associatedtype IndexedType: HasDescrP & Equatable
//}
//
///// indexed Obj
//public struct IndexedG<T: HasDescrP & Equatable>: IdxHashableT, IdxCmpT {
//
//    public var obj: T
//    public var idx: Int
//}
//public extension IndexedG {
//    typealias SELF = IndexedG
//
//    init(_ obj: T,
//         _ idx: Int) {
//        self.obj = obj
//        self.idx = idx
//    }
//
//    var descr: Str {
//        return "\n\(idx), \(obj)"
//    }
//}


