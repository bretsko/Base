

public protocol CustomEquatable {
    
    static func === (lhs: Self, rhs: Self) -> Bool
}

//Array+CustomEquatable
public extension Array where Element: CustomEquatable {
    
    //MARK: -
    
    /// uses CustomEquatable to check
    func indexes(of item: E) -> [Int]? {
        indexes (satisfying: { $0 === item })
    }
}


//MARK: unique

//    /// empty array can be returned
//    var uniqued: [E] {
//        var all: [E] = []
//        forEach { item in
//            if !all.contains(item) {
//                all += [item]
//            }
//        }
//        return all
//    }
//
//    /// returns false if some were not added
//    @discardableResult
//    mutating func addUnique(_ items: [E]) -> Bool {
//
//        guard !items.isEmpty else {
//            return false
//        }
//        var added = true
//        for item in items {
//            if !contains(item) {
//                self.append(item)
//            } else {
//                added = false
//            }
//        }
//        return added
//    }
//
//    /// contains all
//    func contains(_ items: [E]) -> Bool {
//         allSatisfy{items.contains($0)}
//    }
//    func contains(some items: [E]) -> Bool {
//         contains{items.contains($0)}
//    }
//    func contains(no items: [E]) -> Bool {
//         !contains(some: items)
//    }
//
//    //MARK: remove
//
//    /// returns removed items
//    @discardableResult
//    mutating func remove(_ items: [E]) -> [E]? {
//        var removed = [E]()
//        for item in items {
//            if let a = remove(item) {
//                removed.append(a)
//            }
//        }
//        return removed.sth
//    }
//
//
//    /// returns new array
//    /// (if its empty - returns nil)
//    func removing(_ items: [E]) -> [E]? {
//        var a = self
//        a.remove(items)
//        return a.sth
//    }
//
//
//    /// returns removed item
//    @discardableResult
//    mutating func remove(_ item: E) -> E? {
//        //self = filter { $0 != item }
//        guard let idx = index(of: item) else { return nil }
//        return remove(at: idx)
//    }
//
//    /// returns new array
//    /// (if its empty - returns nil)
//    func removing(_ item: E) -> [E]? {
//        var a = self
//        a.remove(item)
//        return a.sth
//    }
//
//    //MARK: removeDuplicates
//
//    /// returns true if any were removed
//    @discardableResult
//    mutating func removeDuplicates() -> Bool {
//        let oldLen = len
//        if let a = removingDuplicates {
//            self = a
//            return oldLen != len
//        } else {
//            return false
//        }
//    }
//
//    /// returns new array if any were removed
//    /// (if empty array was given it is returned)
//    var removingDuplicates: [E]? {
//        let oldLen = len
//        let a = reduce(into: [E]()) {
//            if !$0.contains($1) {
//                $0.append($1) }}
//        if a.len != oldLen {
//            return a
//        } else {
//            return nil
//        }
//    }
//    var containsDuplicates: Bool {
//         removingDuplicates != nil
//    }
//}
