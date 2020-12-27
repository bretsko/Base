


/// assumes to always contain at least 2 indices
public protocol HasIdxsP {
    
    var indexes: [Int] {get}
}

public extension HasIdxsP {
    
    // RangeP
    var from: Int {
         indexes.min()!
    }
    // RangeP
    var to: Int {
         indexes.max()!
    }

    
    var has1: Bool {
         indexes.len == 1
    }
    /// if has only one unit - returns index
    var index: Int? {
         has1 ? indexes.first : nil
    }
    
    
    /// indexes contain given idx
    func contains(_ idx: Int) -> Bool {
         indexes.contains(idx)
    }
    
    /// indexes contain given idx
    func contains(_ idxs: [Int]) -> Bool {
         indexes.contains(idxs)
    }
    
    //MARK: get range
    
    func getIndexes(moreThan idx: Int,
                    includingIt: Bool = false) -> [Int]? {
        if includingIt {
            return indexes.filterSth{$0 >= idx }
        }
        return indexes.filterSth{$0 > idx }
    }
    
    func getIndexes(lessThan idx: Int,
                    includingIt: Bool = false) -> [Int]? {
        if includingIt {
            return indexes.filterSth{$0 <= idx }
        }
        return indexes.filterSth{$0 < idx }
    }
    
    func getIndexes(from idx1: Int,
                    to idx2: Int,
                    includingBoth: Bool = false) -> [Int]? {
        if includingBoth {
            return indexes.filterSth{$0 >= idx1 && $0 <= idx2}
        }
        return indexes.filterSth{$0 > idx1 && $0 < idx2}
    }
}


//public protocol HasIdxs_P {
//    var _indexes: [Int] {get}
//}


//public protocol HasMutIdxsP: HasIdxsP {
//    var indexes: [Int] {get set}
//}




//TODO: impl and use
//public protocol IndexesInitableP {
//    init(_ indexes: [Int])
//}
//
//public protocol IndexSetInitableP {
//    init(_ idxSet: Set<Int>)
//}
//
//public protocol IndexRangeInitableP {
//    init(_ from: Int, _ to: Int)
//}

