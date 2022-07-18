

//@_exported import Base


typealias RngT = RngP & Hashable

//TODO: consider renaming to NonContiguousRange,
// and make separate ContiguousRange (from: Int, to: Int)

/// Non contiguous range, which can be represented by index set or lower and upper bound
/// Lower and upper bound (from and to) can be equal, meaning the range can match single element
public enum Rng: RngT, HasMutIndexSetP, HasDescrP {
    
    case rng(from: Int, to: Int)
    
    case idxSet(IndexSet)
}

public extension Rng {
    
    //TODO: IndexInitableP
    
    /// from and to can be equal -> can match 1 unit
    init(_ from: Int, _ to: Int) {
        crashIf(from > to || from < 0 || to < 0)
        self = .rng(from: from, to: to)
    }
    init(_ idxSet: IndexSet) {
        crashIf(idxSet.isEmpty)
        self = .idxSet(idxSet)
    }
    
    //TODO: if contiguous - make rng?
    init(_ indexes: [Int]) {
        self.init(.init(indexes))
    }
    init(index: Int) {
        self.init([index])
    }
    
    /// crashes if start < 0 or length < 0
    init(start: Int = 0, length: Int) {
        crashIfFalse (start >= 0 && length >= 0)
        self.init(start, start + length)
    }
    
    //MARK: -
    
    var descr: Str {
        var r = "Rng"
        switch self {
        case .idxSet(let idxSet):
            r += ", indices: \(idxSet.sorted())"
        case .rng(let from, let to):
            r += ", from: \(from), to: \(to)"
        }
        return r
    }
    
    
    //MARK: -
    
    init(_ rng: Range<Int>) {
        self.init(rng.lowerBound, rng.upperBound)
    }
    /// can init with from...to
    init(_ rng: ClosedRange<Int>) {
        self.init(rng.lowerBound, rng.upperBound)
    }
    
    //MARK: -
    
    /// Swift ClosedRange
    var closedRange: ClosedRange<Int> {
        from...to
    }
    /// Swift CountableRange (Range)
    var range: CountableRange<Int> {
        .init(uncheckedBounds: (lower: from, upper: to))
    }
}


//extension Rng: HasAllHStatesT {}
//public extension Rng {
//    static func allStates() -> [Rng] {
//        return gen(minIdx: 0, maxIdx: Int.max)!.array
//    }
//
//    static func gen(minIdx: Int,
//                    maxIdx: Int,
//                    step: Int = 1) -> Set<Rng>? {
//
//        var rngSet = Set<Rng>()
//        for i1 in stride(from: minIdx, to: maxIdx, by: step) {
//            for i2 in stride(from: minIdx, to: maxIdx, by: step) {
//                if i2 <= i1 {
//                    continue
//                }
//                rngSet.insert(Rng(i1, i2))
//            }
//        }
//        return rngSet.sth
//    }
//
//    //MARK: genArrays
//
//    /// generates sequences with different combinations and permutations
//    /// step can be negative
//    static func genArrays(minNum: Int,
//                          maxNum: Int,
//                          minArrayLength: Int,
//                          maxArrayLength: Int,
//                          permutate: Bool = true,
//                          step: Int = 1) -> [ [Rng] ]? {
//
//        L.notImpl()
//        //return stride(from: min, to: max, by: step).map{$0.i}.sth
//    }
//}
//
//
