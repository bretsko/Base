

public extension ArraySlice {
    
    var array: Array<E> {
        .init(self)
    }
}

public extension Array {
    
    
    func contains(index i: Int) -> Bool {
        hasSth && indices.contains(i)
    }
    func prefix(len: Int) -> Array? {
        prefix(len).sth?.array
    }
    func suffix(len: Int) -> Array? {
        suffix(len).sth?.array
    }
    
    func dropFirst(len: Int = 1) -> Array? {
        dropFirst(len).sth?.array
    }
    func dropLast(len: Int = 1) -> Array? {
        dropLast(len).sth?.array
    }
    
    
    //MARK: indexes
    
    /// if crashIfNotFound is true and some indexes are not valid - crashes equal indexes in idxs are not skipped
    func units(at idxs: [Int],
               crashIfNotFound: Bool = true) -> Array? {
        
        if crashIfNotFound {
            return idxs.map { self[$0] }
        }
        return idxs.compactMap {
            (count > $0) ? self[$0] : nil
        }
        
//        guard hasSth, idxs.hasSth,
//              idxs.len >= len else {
//            return nil
//        }
//        var r = Array() //TODO: reduce
//        enumerated().forEach { i, a in
//            if idxs.contains(i) {
//                r.append(a)
//            } else if crashIfNotFound {
//                fatalError()
//            }
//        }
//        return r.sth
    }
    
    /// if crashIfNotFound is true and some indexes are not valid - crashes
    /// equal indexes in idxs are not skipped
    func units(from startIdx: Int,
               to endIdx: Int,
               crashIfNotFound: Bool = true) -> Array? {
        crashIf(startIdx < 0 || endIdx < 0 || startIdx >= endIdx)
        
        return units(at: [Int](startIdx...endIdx),
                     crashIfNotFound:crashIfNotFound)
    }
    
    /// animals - imals - 2 = len - 2
    /// Returns a new string containing the chars of the Str from the one at a given idx, including it, to the end.
    func units(from idx: Int) -> Array? {
        guard contains(index:idx) else {
            return nil
        }
        return suffix(len - idx + 1)
        //return substr(from: self.index(startIndex, offsetBy: idx))
    }
    
    /// Returns a new string containing the chars of the Str up to and including, the one at a given idx.
    func units(to idx: Int) -> Array? {
        guard contains(index:idx) else {
            return nil
        }
        return prefix(len: len - idx)
        // var i = max(0, min(idx, len - 1))
        // return substr(to: index(startIndex, offsetBy: i))
    }
    
    
    //MARK: filter
    
    func filterSth(_ cond: BoolCond) -> Array? {
        filter(cond).sth
    }
    
    func filterSth(_ conds: [BoolCond]) -> Array? {
        if conds.isEmpty { // or crash?
            return nil
        }
        var all = self
        for cond in conds {
            if let a = all.filterSth(cond) {
                all = a
            } else {
                return nil
            }
        }
        return all.sth
    }
    
    func filterSth(_ conds: BoolCond...) -> Array? {
        if conds.isEmpty { // or crash?
            return nil
        }
        var all = self
        for cond in conds {
            if let a = all.filterSth(cond) {
                all = a
            } else {
                return nil
            }
        }
        return all.sth
    }
    
    
    //MARK: prefix, suffix
    
    
    func prefix(while cond: BoolCond) -> Array? {
        prefix(while:cond).sth
    }
    func suffix(while cond: BoolCond) -> Array? {
        reversed().prefix(while:cond)
    }
    
    
    /// crashes if supplied array is empty
    func has<T>(prefix: [T],
                _ cond: (E, T) -> Bool) -> Bool {
        
        crashIf(prefix.isEmpty)
        return isEmpty || starts(with: prefix, by: cond)
    }
    
    /// crashes if supplied array is empty
    func has<T>(suffix: [T],
                _ cond: (E, T) -> Bool) -> Bool {
        
        crashIf(suffix.isEmpty)
        return isEmpty || reversed().has(suffix: suffix, cond)
    }
    
    
    //MARK: -
    
    mutating func prepend(_ unit: E) {
        insert(unit, at: 0)
    }
    mutating func prepend(_ units: [E]) {
        self = units + self
    }
    
    
    /// creates many arrays based on cond
    /// let line = "BLANCHE:   I don't want realism. I want magic!"
    /// print(line.split(while: { $0 == " " }))
    /// Prints "["BLANCHE:", "I", "don\'t", "want", "realism.", "I", "want", "magic!"]"
    /// Param maxSplits
    /// print(line.split(while: { $0 == " " }), maxSplits: 1)
    /// Prints "["BLANCHE:", "  I don\'t want realism. I want magic!"]"
    func splitting(with cond: BoolCond,
                   maxSplits: Int = Int.max) -> [Array]? {
        split(maxSplits: maxSplits,
              omittingEmptySubsequences: true,
              whereSeparator: cond).sth?.map{$0.array}
    }
    
    
    //MARK: random
    
    var randIdx: Int {
        Int.rand(count)
    }
    var randItem: E? {
        randomElement()
    }
    
    /// for ex
    /// var source = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
    /// result [30, 10, 70, 50]
    /// if preserverOrder is true [20, 30, 80, 100]
    func randItems(num: Int,
                   preserverOrder: Bool) -> Array? {
        if preserverOrder {
            return randomStableSample(count: num)
        }
        return randomSample(count: num)
    }
    
    
    //MARK: sort
    
    ///  Returns a sorted array based on an optional keypath.
    /// - Parameter path: Key path to sort. The key path type must be Comparable.
    /// - Parameter ascending: If order must be ascending.
    /// - Returns: Sorted array based on keyPath.
    func sorted<T: Comparable>(by path: KeyPath<E, T?>,
                               ascending: Bool = true) -> [E] {
        sorted(by: { (lhs, rhs) -> Bool in
            
            guard let lhsv = lhs[keyPath: path],
                  let rhsv = rhs[keyPath: path] else {
                return false
            }
            if ascending {
                return lhsv < rhsv
            }
            return lhsv > rhsv
        })
    }
    
    ///  Returns a sorted array based on a keypath.
    /// - Parameter path: Key path to sort. The key path type must be Comparable.
    /// - Parameter ascending: If order must be ascending.
    /// - Returns: Sorted array based on keyPath.
    func sorted<T: Comparable>(by path: KeyPath<E, T>,
                               ascending: Bool = true) -> [E] {
         sorted(by: { (lhs, rhs) -> Bool in
            if ascending {
                return lhs[keyPath: path] < rhs[keyPath: path]
            }
            return lhs[keyPath: path] > rhs[keyPath: path]
        })
    }
    
    ///  Sort the array based on an optional keypath.
    /// - Parameters:
    ///   - path: Key path to sort, must be Comparable.
    ///   - ascending: whether order is ascending or not.
    /// - Returns: self after sorting.
    @discardableResult
    mutating func sort<T: Comparable>(by path: KeyPath<E, T?>,
                                      ascending: Bool = true) -> [E] {
        self = sorted(by: path, ascending: ascending)
        return self
    }
    
    ///  Sort the array based on a keypath.
    /// - Parameters:
    ///   - path: Key path to sort, must be Comparable.
    ///   - ascending: whether order is ascending or not.
    /// - Returns: self after sorting.
    @discardableResult
    mutating func sort<T: Comparable>(by path: KeyPath<E, T>,
                                      ascending: Bool = true) -> [E] {
        self = sorted(by: path, ascending: ascending)
        return self
    }
    
    
    //MARK: -
    
    var center: E? {
        guard hasSth else {
            return nil
        }
        return self[Swift.max(round(len.d / 2).l - 1, 0)]
    }
    
    ///  Safely Swap values at i positions.
    /// [1, 2, 3, 4, 5].safeSwap(from: 3, to: 0) -> [4, 2, 3, 1, 5]
    /// ["h", "e", "l", "l", "o"].safeSwap(from: 1, to: 0) -> ["e", "h", "l", "l", "o"]
    /// - Parameters:
    ///   - i: i of first unit.
    ///   - otherIdx: i of other unit.
    mutating func safeSwap(from i: Index,
                           to otherIdx: Index) {
        guard i != otherIdx,
              startIndex ..< endIndex ~= i,
              startIndex ..< endIndex ~= otherIdx else { return }
        swapAt(i, otherIdx)
    }
    
    
    /**
     Returns an Array containing the results of mapping transform over self. The transform provides not only
     each unit of the array but also the i of tha item in the array.
     
     ```
     let items: [SomeObject] = existingArray.mapWithIdx { i, response in
     return SomeObject(i: i, description: response.body)
     }
     ```
     
     - parameter f: The transform that given an unit of the array and an i returns an unit of type T
     
     - returns: The array created by applying the transform to this array.
     */
    func mapWithIdx<T>(_ f: (Int, E) -> T) -> [T] {
         zip(startIndex ..< endIndex, self).map(f)
    }
    
    
    //MARK: operators
    
    
    /// Repeat array multiple times.
    ///        'bar' * 3 -> "barbarbar"
    /// - Parameters:
    ///   - lhs: string to repeat.
    ///   - rhs: number of times to repeat character.
    /// - Returns: new string with given string repeated n times.
    static func * (lhs: Array, rhs: Int) -> Array {
        guard rhs > 0 else { return [] }
        var _arr = lhs
        for _ in 0 ..< rhs {
            _arr.append(contentsOf: lhs)
        }
        return _arr
    }
    
    /// Repeat arrray multiple times.
    ///        3 * 'bar' -> "barbarbar"
    /// - Parameters:
    ///   - lhs: number of times to repeat character.
    ///   - rhs: string to repeat.
    /// - Returns: new string with given string repeated n times.
    static func * (lhs: Int, rhs: Array) -> Array {
        guard lhs > 0 else { return [] }
        
        var _arr = rhs
        for _ in 0 ..< lhs {
            _arr = _arr + rhs
        }
        return _arr
    }
    
    
    subscript(safe range: Range<Index>) -> ArraySlice<E>? {
        if range.endIndex > endIndex {
            if range.startIndex >= endIndex {
                return nil
            }
            return self[range.startIndex ..< endIndex]
        }
        return self[range]
    }
}





