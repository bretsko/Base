


public extension IteratorProtocol {
    typealias E = Element
}
public extension MutableCollection {
    typealias E = Element
}


public extension Collection {
    
    /// indices.map{distance(to: $0)}
    var idxs: [Int] {
        indices.map{distance(to: $0)}
    }
    /// indices.map{distance(to: $0)}.set
    var idxSet: Set<Int> {
        idxs.set
    }
    func distance(to index: Index) -> Int {
        distance(from: startIndex, to: index)
    }
}

public extension Collection where Index == Int {
    
    //MARK: - prefix, suffix
    
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
    
    ///  Get the first idx where condition is met.
    ///        [1, 7, 1, 2, 4, 1, 6].firstIdx { $0 % 2 == 0 } -> 3
    /// - Returns: first idx where the specified condition evaluates to true. (optional)
    func firstIdx(where cond: BoolCond) -> Index? {
        lazy.enumerated().first(where: { _, str in
            cond(str)
        })?.offset
        // for (i, v) in lazy.enumerated() where cond(v) {
        // return i
        // }
        // return nil
    }
    
    ///  Get the last idx where condition is met.
    ///     [1, 7, 1, 2, 4, 1, 8].lastIdx { $0 % 2 == 0 } -> 6
    /// - Returns: last idx where the specified condition evaluates to true. (optional)
    func lastIdx(where cond: BoolCond) -> Index? {
        lazy.enumerated().reversed().first(where: { _, str in
            cond(str)
        })?.offset
//        for (i, v) in lazy.enumerated().reversed() where cond(v) {
//            return i
//        }
//        return nil
    }
    
    ///  Get all indices where condition is met.
    ///     [1, 7, 1, 2, 4, 1, 8].indices(where: { $0 == 1 }) -> [0, 2, 5]
    /// - Parameter condition: condition to evaluate each unit against.
    /// - Returns: all indices where the specified condition evaluates to true. (optional)
    func indices(where cond: BoolCond) -> [Index]? {
        enumerated().map{ i, str in
            if cond(str) {
                return i
            }
            return nil
        }.compactMap{$0}
        
        //var idxs: [Index] = []
//        for (i, v) in lazy.enumerated() where cond(v) {
//            idxs.append(i)
//        }
//        return idxs.isEmpty ? nil : idxs
    }
    
    //    func prefix(while cond: BoolCond) -> Self? {
    //        return prefix(while:cond).sth
    //    }
    
    //    func suffix(while cond: BoolCond) -> Self? {
    //        return reversed().prefix(while:cond)
    //    }
    
    
    /// all items which satisfy the condition are returned in collection
    //    func filterSth(_ conds: [BoolCond]) -> Self? {
    //        if conds.isEmpty { // or crash?
    //            return nil
    //        }
    //        var all = self
    //        for cond in conds {
    //            if let a = all.filterSth(cond) {
    //                all = a
    //            } else {
    //                return nil
    //            }
    //        }
    //        return all.sth
    //    }
    //
    //    /// all items which satisfy the condition are returned in collection
    //    func filterSth(_ conds: BoolCond...) -> Self? {
    //        if conds.isEmpty { // or crash?
    //            return nil
    //        }
    //        var all = self
    //        for cond in conds {
    //            if let a = all.filterSth(cond) {
    //                all = a
    //            } else {
    //                return nil
    //            }
    //        }
    //        return all.sth
    //    }
    
    
    
    /**
     Returns an Self containing the results of mapping transform over self. The transform provides not only
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
    
    ///  Calls the given closure with an array of size of the parameter slice.
    ///     [0, 2, 4, 7].forEach(slice: 2) { print($0) } -> //print: [0, 2], [4, 7]
    ///     [0, 2, 4, 7, 6].forEach(slice: 2) { print($0) } -> //print: [0, 2], [4, 7], [6]
    /// - Parameters:
    ///   - slice: size of array in each interation.
    ///   - body: a closure that takes an array of slice size as a parameter.
    func forEach(slice: Int, body: ([E]) -> Void)  {
        guard slice > 0, hasSth else { return }
        
        var value = 0
        while value < len {
            body(Array(self[Swift.max(value, startIndex)..<Swift.min(value + slice, endIndex)]))
            value += slice
        }
    }
    
    ///  Returns an array of slices of length "size" from the array. If array can't be split evenly, the final slice will be the remaining units.
    ///     [0, 2, 4, 7].group(by: 2) -> [[0, 2], [4, 7]]
    ///     [0, 2, 4, 7, 6].group(by: 2) -> [[0, 2], [4, 7], [6]]
    /// - Parameter size: The size of the slices to be returned.
    /// - Returns: grouped self.
    func group(by size: Int) -> [[E]]? {
        guard size > 0, hasSth else { return nil }
        
        var value = 0
        var slices: [[E]] = []
        while value < len {
            slices.append(Array(self[Swift.max(value, startIndex)..<Swift.min(value + size, endIndex)]))
            value += size
        }
        return slices
    }
    
    
    //MARK: sort
    
    ///  Returns a sorted array based on an optional keypath.
    /// - Parameter path: Key path to sort. The key path type must be Comparable.
    /// - Parameter ascending: If order must be ascending.
    /// - Returns: Sorted array based on keyPath.
    func sorted<T: Comparable>(by path: KeyPath<E, T?>,
                               ascending: Bool = true) -> [E] {
        
        return sorted(by: { (lhs, rhs) -> Bool in
            
            guard let lhsv = lhs[keyPath: path],
                  let rhsv = rhs[keyPath: path] else {
                return false
            }
            return ascending ? lhsv < rhsv : lhsv > rhsv
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
}

//MARK: - Random

public extension Collection {
    typealias E = Element
    
    /// returns nil - if the array is empty
    func randItems(num: Int) -> [E]? {
        guard !isEmpty, num > 0 else { return nil }
        var all = [E]()
        num.times {
            all.append(randomElement()!)
        }
        return all
    }
    
    var randItem: E? {
        randomElement()
    }
}


//TODO: index logic - can get items from specific indieces...
//public extension RandomAccessCollection where Index == Int {}


//MARK: -

public extension Collection {
    
    ///  Safe protects the array from out of bounds by use of optional.
    ///        let arr = [1, 2, 3, 4, 5]
    ///        arr[safe: 1] -> 2
    ///        arr[safe: 10] -> nil
    /// - Parameter idx: idx of unit to access unit.
    subscript(safe idx: Index) -> Iterator.Element? {
         indices.contains(idx) ? self[idx] : nil
    }
    
    
    ///  Performs each closure for each unit of collection in parallel.
    func forEachInParallel(_ each: (Iterator.Element) -> Void) {
        let indices = indicesArray
        
        DispatchQueue.concurrentPerform(iterations: indices.count) { idx in
            let elementIdx = indices[idx]
            each(self[elementIdx])
        }
    }
    
    private var indicesArray: [Index] {
        var indices: [Index] = []
        var anIdx = startIndex
        while anIdx != endIndex {
            indices.append(anIdx)
            anIdx = index(after: anIdx)
        }
        return indices
    }
}


public extension MutableCollection where Index == Int {
    
    mutating func shuffle() {
        guard len > 1 else { return }
        
        for i in indices {
            let j = Int.rand(len - i) + i
            guard i != j else { continue }
            swapAt(i, j)
        }
    }
    
    //    var randItem: Iterator.Element {
    //        return self[randIdx]
    //    }
    
    //    mutating func shuffle() {
    //
    //        guard len > 1 else { return }
    //        for i in startIndex ..< endIndex - 1 {
    //            let randomIdx = Int.rand(endIndex - i) + i
    //            if i != randomIdx { swapAt(i, randomIdx) }
    //        }
    //    }
}


public extension RangeReplaceableCollection {
    
    ///  Returns a new rotated collection by the given places.
    ///     [1, 2, 3, 4].rotated(by: 1) -> [4,1,2,3]
    ///     [1, 2, 3, 4].rotated(by: 3) -> [2,3,4,1]
    ///     [1, 2, 3, 4].rotated(by: -1) -> [2,3,4,1]
    /// - Parameter places: Number of places that the array be rotated. If the value is positive the end becomes the start, if it negative it's that start becom the end.
    /// - Returns: The new rotated collection.
    func rotated(by places: Int) -> Self {
        var copy = self
        return copy.rotate(by: places)
    }
    
    ///  Rotate the collection by the given places.
    ///     [1, 2, 3, 4].rotate(by: 1) -> [4,1,2,3]
    ///     [1, 2, 3, 4].rotate(by: 3) -> [2,3,4,1]
    ///     [1, 2, 3, 4].rotated(by: -1) -> [2,3,4,1]
    /// - Parameter places: The number of places that the array should be rotated. If the value is positive the end becomes the start, if it negative it's that start become the end.
    /// - Returns: self after rotating.
    @discardableResult
    mutating func rotate(by places: Int) -> Self {
        guard places != 0 else { return self }
        
        let placesToMove = places%count
        if placesToMove > 0 {
            let range = index(endIndex, offsetBy: -placesToMove)...
            let slice = self[range]
            removeSubrange(range)
            insert(contentsOf: slice, at: startIndex)
        } else {
            let range = startIndex..<index(startIndex, offsetBy: -placesToMove)
            let slice = self[range]
            removeSubrange(range)
            append(contentsOf: slice)
        }
        return self
    }
    
    ///  Removes the first unit of the collection which satisfies the given predicate.
    ///        [1, 2, 2, 3, 4, 2, 5].removeFirst { $0 % 2 == 0 } -> [1, 2, 3, 4, 2, 5]
    ///        ["h", "e", "l", "l", "o"].removeFirst { $0 == "e" } -> ["h", "l", "l", "o"]
    /// - Parameter predicate: A closure that takes an unit as its argument and returns a Boolean value that indicates whether the passed unit represents a match.
    /// - Returns: The first unit for which predicate returns true, after removing it. If no units in the collection satisfy the given predicate, returns `nil`.
    @discardableResult
    mutating func removeFirst(where predicate: BoolCond) -> E? {
        guard let i = firstIndex(where: predicate) else {
            return nil
        }
        return remove(at: i)
    }
}



//MARK: - fileprivate

fileprivate extension Collection {
    
    var sth: Self? {
         isEmpty ? nil : self
    }
    var hasSth: Bool {
         !isEmpty
    }
}

fileprivate extension Collection where Index == Int {
    
    // reason why fileprivate is I cannot add HasCountP or CanBeEmptyP
    var len: Int {
         count
    }
    var has1: Bool {
         len == 1
    }
    /// count > 1
    var hasMany: Bool {
         count > 1
    }
    var randIdx: Int {
         Int.rand(count)
    }
    var center: E? {
        guard hasSth else {
            return nil
        }
        return self[Swift.max(round(len.d / 2).l - 1, 0)]
    }
}







public extension Collection where Element == IntegerLiteralType, Index == Int {
    
    // http://stackoverflow.com/questions/28288148/making-my-function-calculate-average-of-array-swift
    ///  Average of all units in array.
    var average: Double {
         isEmpty ? 0 : reduce(0, +).d / len.d
    }
}


public extension Collection where Element: FloatingPoint {
    
    var average: E {
        guard hasSth else { return 0 }
        return reduce(0, {$0 + $1}) / E(count)
    }
}


//TODO:
//public extension Collection where Index == Int {

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


//MARK: indexes

/// if crashIfNotFound is true and some indexes are not valid - crashes equal indexes in idxs are not skipped
//    func units(at idxs: [Int],
//               crashIfNotFound: Bool = true) -> Self? {
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
//               crashIfNotFound: Bool = true) -> Self? {
//        crashIf(startIdx < 0 || endIdx < 0 || startIdx >= endIdx)
//
//        return units(at: Self<Int>(startIdx...endIdx),
//                     crashIfNotFound:crashIfNotFound)
//    }
//
//    /// animals - imals - 2 = len - 2
//    /// Returns a new string containing the chars of the Str from the one at a given idx, including it, to the end.
//    func units(from idx: Int) -> Self? {
//        guard hasSth, contains(index:idx) else {
//            return nil
//        }
//        return suffix(len - idx + 1)
//        //return substr(from: self.index(startIndex, offsetBy: idx))
//    }
//
//    /// Returns a new string containing the chars of the Str up to and including, the one at a given idx.
//    func units(to idx: Int) -> Self? {
//        guard hasSth, contains(index:idx) else {
//            return nil
//        }
//        return prefix(len - idx).array
//        // var i = max(0, min(idx, len - 1))
//        // return substr(to: index(startIndex, offsetBy: i))
//    }


//MARK: -

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
//                   maxSplits: Int = Int.max) -> [Self]? {
//        return split(maxSplits: maxSplits, omittingEmptySubsequences: true, whereSeparator: cond).sth?.map{$0.array}
//    }


//MARK: random

//    var randIdx: Int {
//        return Int.rand(count)
//    }

//    /// returns nil - if the array is empty
//    func randItems(num: Int) -> Self? {
//        var all = [E]()
//        num.times {
//            if let a = randomElement() {
//                all.append(a)
//            }
//        }
//        return all.sth
//    }


//MARK: shuffle

// http://stackoverflow.com/questions/37843647/shuffle-array-swift-3
///  Shuffle array using Fisher-Yates Algorithm
//    mutating func shuffle() {
//        guard len > 1 else { return }
//
//        for i in startIndex ..< endIndex - 1 {
//            let randomIdx = Int.rand(endIndex - i) + i
//            if i != randomIdx { swapAt(i, randomIdx) }
//        }
//    }

///  Shuffled version of array. (Using Fisher-Yates Algorithm)
/// [1, 2, 3, 4, 5].shuffled // return a shuffled version from given array e.g. [2, 4, 1, 3, 5].
/// - Returns: the array with its units shuffled.
//    var shuffled: Self {
//        var a = self
//        a.shuffle()
//        return a
//    }



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



//MARK: operators


//    /// Repeat array multiple times.
//    ///        'bar' * 3 -> "barbarbar"
//    /// - Parameters:
//    ///   - lhs: string to repeat.
//    ///   - rhs: number of times to repeat character.
//    /// - Returns: new string with given string repeated n times.
//    static func * (lhs: Self, rhs: Int) -> Self {
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
//    static func * (lhs: Int, rhs: Self) -> Self {
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
//}
