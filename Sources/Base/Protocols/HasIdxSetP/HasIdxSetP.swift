



public protocol HasIdxSetP: HasIdxsP {
    
    var idxSet: IndexSet {get}
}

public extension HasIdxSetP {
    
    // HasIdxsP
    var indexes: [Int] {
        idxSet.array
    }
    
    //todo - set funcs
}


public protocol HasMutIndexSetP: HasIdxSetP { //? HasMutIdxsP
    var idxSet: IndexSet {get set}
    
    // true if inserted
    //    @discardableResult
    //    func insert(_ idx: Int) -> Bool
}
public extension HasMutIndexSetP {
    
    // HasIdxsP
    var indexes: [Int] {
        get {
            Array(idxSet)
        }
        set {
            idxSet = .init(newValue)
        }
    }
    
    //todo - set funcs
}



public protocol IndexSetHashableT: HasIdxSetP, Hashable {}

//public extension IndexSetHashableT {
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(idxSet)
//    }
//}




//public extension HasMutIndexSetP {
//
//    // true if inserted
//    @discardableResult
//    mutating func insert(_ idx: Int) -> Bool {
//        return idxSet.insert(idx).inserted
//    }
//
//    // true if removed
//    @discardableResult
//    mutating func remove(_ idx: Int) -> Bool {
//        return idxSet.remove(idx) != nil
//    }
//}


// HasMutIdxsP, order not preserved
//    var indexes: [Int] {
//        get {
//            return Array(idxSet)
//        }
//        set {
//            idxSet = Set(idxSet)
//        }
//    }
//}


//public protocol HasIndexSet_P: HasIdxs_P {
//    var _indexSet: Set<Int>? {get}
//}
//public extension HasIndexSet_P {
//
//    // HasIdxs_P
//    var _indexes: [Int]? {
//        return _indexSet?.array
//    }
//}


//public protocol HasIndexSet_P: HasIdxs_P {
//    var _indexSet: Set<Int>? {get}
//}
//public extension HasIndexSet_P {
//
//    // HasIdxs_P
//    var _indexes: [Int]? {
//        return _indexSet?.array
//    }
//}


//MARK: Array ext


//public extension Array where Element: HasIdxSetP {
//    //TODO: getRanges, getIndexSets
//
//    //func allHave(_ idxSet: IndexSet) -> Bool {
//    //    return allSatisfy{$0.idxSet == idxSet}
//    //}
//    //func noneHave(_ idxSet: IndexSet) -> Bool {
//    //    return allSatisfy{$0.idxSet != idxSet}
//    //}
//}


//public extension Array where Element: HasIdxsP {
// //TODO:  getIndexes
//}

