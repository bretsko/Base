



public extension Array where Element: CustomStringConvertible {
    
    //? IObj
    typealias IdxObjType = IndexedObj<E>
    
    
    //TODO: try find better way
    
    //TODO: index validation
    /// Makes all combinations of subsequent elements
    /// [0], [0,1], [0,1,2], [1,2], [1,2,3], etc
    /// If array is empty - returns empty Set
    //    func allSubseqIdxCombis(startIdx: Int,
    //                            endIdx: Int) -> Set<Set<Int>> {
    //
    //    }
    
    //        let set1 = allSubseqIdxCombis(startIdx: Int,
    //                           endIdx:)
    
    /// Makes all combinations of subsequent elements
    /// [0], [0,1], [0,1,2], [1,2], [1,2,3], etc
    /// If array is empty - returns empty Set
    var allSubseqCombis: Set<Set<IdxObjType>> {
        allSubseqIdxCombis
            .map{ $0.array.sorted() }
            .map{ indexedObjs(at: $0) }.set
    }
    
    
    //MARK: -
    
    /// uses array order to generate indexes for each IndexedObj
    var idxObjs: Set<IdxObjType> {
        enumerated().map { idx, obj in
            IdxObjType(idx: idx, obj: obj)
        }.set
    }
    
    func indexedObjs(at indexes: Set<Int>) -> Set<IdxObjType> {
        indexes.map { i in
            IdxObjType(idx: i, obj: self[i])
        }.set
    }
    
    func indexedObjs(at indexes: [Int]) -> Set<IdxObjType> {
        indexedObjs(at: Set(indexes))
    }
}

//MARK: - index

public extension Array {
    
    /// Makes all combinations of subsequent elements
    /// [0], [0,1], [0,1,2], [1,2], [1,2,3], etc
    /// If array is empty - returns empty Set
    var allSubseqIdxCombis: Set<Set<Int>> {
        idxSet.allSubsequentCombis
    }
}


public extension Set where Element == Int {
    
    /// Makes all combinations of subsequent elements starting from the given index to the
    /// [0], [0,1], [0,1,2], [1,2], [1,2,3], etc
    /// If set is empty - returns empty Set
    var allSubsequentCombis: Set<Set<Int>> {
        
        var r = Set<Set<Int>>([self])
        
        let lastIdx = len - 1
        array.forEach {
            let a = makeSubsequentCombinations(from: $0,
                                               to: lastIdx)
            r.formUnion(a)
        }
        
        //TODO: removed -> test
        //        reversed().forEach {
        //            let a = makeSubsequentCombinations(from: $0,
        //                                               to: lastIdx)
        //            r.formUnion(a)
        //        }
        return r
    }
}

public extension Array where Element == Int {
    
    /// Makes all combinations of subsequent elements starting from the given index to the
    /// [0], [0,1], [0,1,2], [1,2], [1,2,3], etc
    var allSubsequentCombis: Set<Set<Int>> {
        self.set.allSubsequentCombis
    }
}


//MARK: -

public extension Array where Element: IndexedObjT {
    
    var objs: [Element.T] {
        map{$0.obj}
    }
}
public extension Set where Element: IndexedObjT {
    
    var objs: [Element.T] {
        map{$0.obj}
    }
}

//MARK: - Int


/// Makes all combinations of subsequent elements starting from the given index to the
/// [0], [0,1], [0,1,2], [1,2], [1,2,3], etc
func makeSubsequentCombinations(from num1: Int,
                                to num2: Int) -> Set<Set<Int>> {
    crashIf(num1 > num2)
        
    let set1 = Array(num1...num2).set
    var r: Set<Set<Int>> = .init([set1])
    
    r.insert([num1])
    
    let nextNum = num1 + 1
    
    if nextNum <= num2  {
        
        var numSet = Set([num1])
        
        // add all until end
        for i2 in nextNum...num2 {
            numSet.insert(i2)
            r.insert(numSet)
        }
    }
    return r
}

