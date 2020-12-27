

public extension Range where Bound: Strideable, Bound.Stride: SignedInteger {
    typealias E = Range.Bound
    
    //MARK: filter
    
    func filterSth(_ cond: BoolCond) -> [E]? {
         filter(cond).sth
    }
    
    ///
    func filterSth(_ conds: [BoolCond]) -> [E]? {
        if conds.isEmpty { // or crash?
            return nil
        }
        var all = [E]()
        for cond in conds {
            if let a = all.filterSth(cond) {
                all = a
            } else {
                return nil
            }
        }
        return all.sth
    }
    
    func filterSth(_ conds: BoolCond...) -> [E]? {
        if conds.isEmpty { // or crash?
            return nil
        }
        var all = [E]()
        for cond in conds {
            if let a = all.filterSth(cond) {
                all = a
            } else {
                return nil
            }
        }
        return all.sth
    }
}


public extension NSRange {
    
    init(_ rng: Range<Str.Index>,
         in str: Str) {
        self.init()
        self.location = str.utf16.distance(from: str.startIndex,
                                           to: rng.lowerBound)
        self.length = str.utf16.distance(from: rng.lowerBound,
                                         to: rng.upperBound)
    }
    
    // Adapted from: https://www.hackingwithswift.com/example-code/language/how-to-convert-an-nsrange-to-a-swift-str-index
    
    /// Converts NSRange to Range<StrIdx>
    ///
    /// - Parameter str: The str from which the NSRange is extracted.
    /// - Returns: The `Range<StrIdx>` representation of the NSRange.
    func range(for str: Str) -> Range<StrIdx>? {
        guard location != NSNotFound else { return nil }
        
        guard let fromUTFIndex = str.utf16.index(str.utf16.startIndex,
                                                 offsetBy: location,
                                                 limitedBy: str.utf16.endIndex) else { return nil }
        guard let toUTFIndex = str.utf16.index(fromUTFIndex,
                                               offsetBy: length,
                                               limitedBy: str.utf16.endIndex) else { return nil }
        
        guard let fromIndex = StrIdx(fromUTFIndex,
                                     within: str) else { return nil }
        guard let toIndex = StrIdx(toUTFIndex,
                                   within: str) else { return nil }
        
        return fromIndex ..< toIndex
    }
}









//TODO: Range + prefix, suffix


//    func prefix(while cond: BoolCond) -> Array<E>? {
//        return prefix(while:cond).sth
//    }
//    func suffix(while cond: BoolCond) -> Array<E>? {
//        return reversed().prefix(while:cond)
//    }


/// crashes if supplied array is empty
//    func has<T>(prefix: [T],
//                _ cond: (E, T) -> Bool) -> Bool {
//
//        crashIf(prefix.isEmpty)
//        return isEmpty ?? starts(with: prefix, by: cond)
//    }
//
//    /// crashes if supplied array is empty
//    func has<T>(suffix: [T],
//                _ cond: (E, T) -> Bool) -> Bool {
//
//        crashIf(suffix.isEmpty)
//        return isEmpty ?? reversed().has(suffix: suffix, cond)
//    }



//    //MARK: indexes
//
//    /// if crashIfNotFound is true and some indexes are not valid - crashes equal indexes in idxs are not skipped
//    func units(at idxs: [Int],
//               crashIfNotFound: Bool = true) -> Array<E>? {
//        guard hasSth,
//            idxs.hasSth,
//            idxs.len >= len else {
//                return nil
//        }
//        var r = [E]()
//        enumerated().forEach { i, a in
//            if idxs.contains(i) {
//                r.append(a)
//            } else if crashIfNotFound {
//                printfatalError()
//            }
//        }
//        return r.sth
//    }
//
//    /// if crashIfNotFound is true and some indexes are not valid - crashes
//    /// equal indexes in idxs are not skipped
//    func units(from startIdx: Int,
//               to endIdx: Int,
//               crashIfNotFound: Bool = true) -> Array<E>? {
//        crashIf(startIdx < 0 || endIdx < 0 || startIdx >= endIdx)
//
//        return units(at: Array<Int>(startIdx...endIdx),
//                     crashIfNotFound:crashIfNotFound)
//    }
//
//    /// animals - imals - 2 = len - 2
//    /// Returns a new string containing the chars of the Str from the one at a given idx, including it, to the end.
//    func units(from idx: Int) -> Array? {
//        guard hasSth, idx + 1 <= len else {
//            return nil
//        }
//        return suffix(len - idx + 1)
//        //return substr(from: self.index(startIndex, offsetBy: idx))
//    }
//
//    /// Returns a new string containing the chars of the Str up to and including, the one at a given idx.
//    func units(to idx: Int) -> Array<E>? {
//        guard hasSth, idx + 1 <= len else {
//            return nil
//        }
//        return prefix(len - idx)
//        // var i = max(0, min(idx, len - 1))
//        // return substr(to: index(startIndex, offsetBy: i))
//    }
//
//
//    //MARK: -
//
//    mutating func prepend(_ unit: E) {
//        insert(unit, at: 0)
//    }
//    mutating func prepend(_ units: [E]) {
//        self = units + self
//    }
//
//
//    /// creates many arrays based on cond
//    /// let line = "BLANCHE:   I don't want realism. I want magic!"
//    /// print(line.split(while: { $0 == " " }))
//    /// Prints "["BLANCHE:", "I", "don\'t", "want", "realism.", "I", "want", "magic!"]"
//    /// Param maxSplits
//    /// print(line.split(while: { $0 == " " }), maxSplits: 1)
//    /// Prints "["BLANCHE:", "  I don\'t want realism. I want magic!"]"
//    func splitting(with cond: BoolCond,
//                   maxSplits: Int = Int.max) -> [Array]? {
//        return split(maxSplits: maxSplits, omittingEmptySubsequences: true, whereSeparator: cond).sth?.map{$0.array}
//    }
//
//
//    //MARK: random
//
//    var randIdx: Int {
//        return Int.rand(count)
//    }
//    var randItem: E? {
//        return randomElement()
//    }
//    /// returns nil - if the array is empty
//    func randItems(num: Int) -> Array<E>? {
//        var all = [E]()
//        num.times {
//            if let a = randomElement() {
//                all.append(a)
//            }
//        }
//        return all.sth
//    }
//
//
//    //MARK: shuffle
//
//    // http://stackoverflow.com/questions/37843647/shuffle-array-swift-3
//    ///  Shuffle array using Fisher-Yates Algorithm
//    mutating func shuffle() {
//        guard len > 1 else { return }
//
//        for i in startIndex ..< endIndex - 1 {
//            let randomIdx = Int.rand(endIndex - i) + i
//            if i != randomIdx { swapAt(i, randomIdx) }
//        }
//    }
//
//    ///  Shuffled version of array. (Using Fisher-Yates Algorithm)
//    /// [1, 2, 3, 4, 5].shuffled // return a shuffled version from given array e.g. [2, 4, 1, 3, 5].
//    /// - Returns: the array with its units shuffled.
//    var shuffled: Array {
//        var a = self
//        a.shuffle()
//        return a
//    }
//
//
//    //MARK: sort
//
//    ///  Returns a sorted array based on an optional keypath.
//    /// - Parameter path: Key path to sort. The key path type must be Comparable.
//    /// - Parameter ascending: If order must be ascending.
//    /// - Returns: Sorted array based on keyPath.
//    func sorted<T: Comparable>(by path: KeyPath<E, T?>,
//                               ascending: Bool = true) -> [E] {
//
//        return sorted(by: { (lhs, rhs) -> Bool in
//
//            guard let lhsv = lhs[keyPath: path],
//                let rhsv = rhs[keyPath: path] else {
//                    return false
//            }
//            if ascending {
//                return lhsv < rhsv
//            }
//            return lhsv > rhsv
//        })
//    }
//
//    ///  Returns a sorted array based on a keypath.
//    /// - Parameter path: Key path to sort. The key path type must be Comparable.
//    /// - Parameter ascending: If order must be ascending.
//    /// - Returns: Sorted array based on keyPath.
//    func sorted<T: Comparable>(by path: KeyPath<E, T>,
//                               ascending: Bool = true) -> [E] {
//        return sorted(by: { (lhs, rhs) -> Bool in
//            if ascending {
//                return lhs[keyPath: path] < rhs[keyPath: path]
//            }
//            return lhs[keyPath: path] > rhs[keyPath: path]
//        })
//    }
//
//    ///  Sort the array based on an optional keypath.
//    /// - Parameters:
//    ///   - path: Key path to sort, must be Comparable.
//    ///   - ascending: whether order is ascending or not.
//    /// - Returns: self after sorting.
//    @discardableResult
//    mutating func sort<T: Comparable>(by path: KeyPath<E, T?>,
//                                      ascending: Bool = true) -> [E] {
//        self = sorted(by: path, ascending: ascending)
//        return self
//    }
//
//    ///  Sort the array based on a keypath.
//    /// - Parameters:
//    ///   - path: Key path to sort, must be Comparable.
//    ///   - ascending: whether order is ascending or not.
//    /// - Returns: self after sorting.
//    @discardableResult
//    mutating func sort<T: Comparable>(by path: KeyPath<E, T>,
//                                      ascending: Bool = true) -> [E] {
//        self = sorted(by: path, ascending: ascending)
//        return self
//    }
//
//
//    //MARK: -
//
//    var center: E? {
//        guard hasSth else {
//            return nil
//        }
//        return self[Swift.max(round(len.d / 2).l - 1, 0)]
//    }
//
//    ///  Safely Swap values at i positions.
//    /// [1, 2, 3, 4, 5].safeSwap(from: 3, to: 0) -> [4, 2, 3, 1, 5]
//    /// ["h", "e", "l", "l", "o"].safeSwap(from: 1, to: 0) -> ["e", "h", "l", "l", "o"]
//    /// - Parameters:
//    ///   - i: i of first unit.
//    ///   - otherIdx: i of other unit.
//    mutating func safeSwap(from i: Index,
//                           to otherIdx: Index) {
//        guard i != otherIdx,
//            startIndex ..< endIndex ~= i,
//            startIndex ..< endIndex ~= otherIdx else { return }
//        swapAt(i, otherIdx)
//    }
//
//
//    /**
//     Returns an Array containing the results of mapping transform over self. The transform provides not only
//     each unit of the array but also the i of tha item in the array.
//
//     ```
//     let items: [SomeObject] = existingArray.mapWithIdx { i, response in
//     return SomeObject(i: i, description: response.body)
//     }
//     ```
//
//     - parameter f: The transform that given an unit of the array and an i returns an unit of type T
//
//     - returns: The array created by applying the transform to this array.
//     */
//    func mapWithIdx<T>(_ f: (Int, E) -> T) -> [T] {
//        return zip(startIndex ..< endIndex, self).map(f)
//    }
//
//
//    //MARK: operators
//
//
//    /// Repeat array multiple times.
//    ///        'bar' * 3 -> "barbarbar"
//    /// - Parameters:
//    ///   - lhs: string to repeat.
//    ///   - rhs: number of times to repeat character.
//    /// - Returns: new string with given string repeated n times.
//    static func * (lhs: Array, rhs: Int) -> Array {
//        guard rhs > 0 else { return [] }
//        var _arr = lhs
//        for i in 0 ..< rhs {
//            _arr.append(contentsOf: lhs)
//        }
//        return _arr
//    }
//
//    /// Repeat arrray multiple times.
//    ///        3 * 'bar' -> "barbarbar"
//    /// - Parameters:
//    ///   - lhs: number of times to repeat character.
//    ///   - rhs: string to repeat.
//    /// - Returns: new string with given string repeated n times.
//    static func * (lhs: Int, rhs: Array) -> Array {
//        guard lhs > 0 else { return [] }
//
//        var _arr = rhs
//        for i in 0 ..< lhs {
//            _arr = _arr + rhs
//        }
//        return _arr
//    }
//
//
//    subscript(safe range: Range<Index>) -> ArraySlice<E>? {
//        if range.endIndex > endIndex {
//            if range.startIndex >= endIndex {
//                return nil
//            }
//            return self[range.startIndex ..< endIndex]
//        }
//        return self[range]
//    }
