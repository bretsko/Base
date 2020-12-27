
public extension Sequence where Element: Hashable {
    var set: Set<E> {
        Set(self)
    }
}

public extension Sequence {
    typealias E = Element 
    typealias BoolCond = (E) -> Bool
    typealias VoidBlock = (E) -> Void
    
    var array: [E] {
        Array(self)
    }
    
    var shuffled: [E] {
        var arr = array
        guard arr.count > 1 else {
            return arr
        }
        array.indices.forEach { i in
            let j = Int(arc4random_uniform(UInt32(arr.count - i))) + i
            arr.swapAt(i, j)
        }
        return arr
    }
    
    
    //MARK: -
    
    
    ///  Get last unit that satisfies a conditon.
    ///        [2, 2, 4, 7].last(where: {$0 % 2 == 0}) -> 4
    /// - Parameter cond: cond to evaluate each unit against.
    /// - Returns: the last unit in the array matching the specified cond. (optional)
    func last(where cond: BoolCond) -> E? {
        array.last(where: cond) // reversed().first(where: { cond($0)})
    }
    
    func count(_ cond: BoolCond) -> Int {
        array.count(cond) // filter{cond($0)}.len
    }
    
    /// some -> maybe all!
    func has(_ cond: BoolCond) -> Bool {
        array.has(cond) //some(satisfy: cond)
    }
    
    func some(satisfy cond: BoolCond) -> Bool {
        array.some(satisfy: cond) // contains { cond($0) }
    }
    func none(satisfy cond: BoolCond) -> Bool {
        array.none(satisfy: cond) // !some(satisfy: cond)
    }
    
    //    func allSatisfy(_ cond: BoolCond) -> Bool {
    //         allSatisfy(cond) //!contains {  !cond($0) }
    //    }
    
    
    //MARK: -
    
    ///  Calls the given closure with each unit where cond is true.
    ///        [0, 2, 4, 7].forEach(where: {$0 % 2 == 0}, body: { print($0)}) -> //print: 0, 2, 4
    /// - Parameters:
    ///   - cond: cond to evaluate each unit against.
    ///   - body: a closure that takes an unit of the array as a parameter.
    func forEach(where cond: BoolCond,
                 _ body: VoidBlock)  {
        for e in self where cond(e) {
            body(e)
        }
    }
    
    ///  Reduces an array while returning each interim combination.
    ///     [1, 2, 3].accumulate(initial: 0, next: +) -> [1, 3, 6]
    /// - Parameters:
    ///   - initial: initial value.
    ///   - next: closure that combines the accumulating value and next unit of the array.
    /// - Returns: an array of the final accumulated value and each interim combination.
    //    func accumulate<U>(initial: U,
    //                       next: (U, E) -> U) -> [U] {
    //        var r = initial
    //        return map {
    //            r = next(r, $0)
    //            return r
    //        }
    //    }
    //
    //    ///  Filtered and map in a single operation.
    //    ///     [1,2,3,4,5].filtered({ $0 % 2 == 0 }, map: { $0.string }) -> ["2", "4"]
    //    /// - Parameters:
    //    ///   - cond: cond of inclusion to evaluate each unit against.
    //    ///   - transform: transform unit function to evaluate every unit.
    //    /// - Returns: Return an filtered and mapped array.
    //    func filterMap<T>(_ cond: BoolCond,
    //                      map transform: (E) -> T) -> [T] {
    //        return compactMap{
    //            return cond($0) ? transform($0) : nil
    //        }
    //    }
    //
    //
    //    func reduce2Array(_ block: ([E], E) -> [E]) -> [E] {
    //        return reduce([E](), block)
    //    }
    //    func reduce2OptionalArray(_ block: ([E]?, E?) -> [E]?) -> [E]? {
    //        return reduce([E](), block)
    //    }
    
    ///  Get the only unit based on a cond.
    ///     [].single(where: {_ in true}) -> nil
    ///     [4].single(where: {_ in true}) -> 4
    ///     [1, 4, 7].single(where: {$0 % 2 == 0}) -> 4
    ///     [2, 2, 4, 7].single(where: {$0 % 2 == 0}) -> nil
    /// - Parameter cond: cond to evaluate each unit against.
    /// - Returns: The only unit in the array matching the specified cond. If there are more matching units, nil is returned. (optional)
    //    func single(where cond: BoolCond) -> E? {
    //        var singleElement: E?
    //        for unit in self where cond(unit) {
    //            guard singleElement == nil else {
    //                singleElement = nil
    //                break
    //            }
    //            singleElement = unit
    //        }
    //        return singleElement
    //    }
}


//MARK: - Equatable


public extension Sequence where Element: Equatable {
    
    /// uses Equatable to compare
    func contains(_ units: [E]) -> Bool {
        units.allSatisfy{self.contains($0)}
    }
}

public extension Sequence where Iterator.Element: Equatable {
    
    /// uses Equatable to compare
    func uniqued() -> [Iterator.E] {
        reduce([]) { items, item in
            items.contains(item)
                ? items
                : items + [item]
        }
    }
    
    /// all objs are equal (and not empty array)
    /// uses Equatable to compare
    var allAreEqual: Bool {
        uniqued().len == 1
    }
}


//MARK: - Hashable

//?
//public extension Sequence where Element: Hashable {
//    
//    /// uses Hashable to compare
//    var containsDuplicates: Bool {
//        //array.len == array.uniqued().len
//        //OR
//        // var set = Set<E>()
//        // return allSatisfy{set.insert($0).inserted}
//    }
//}


//MARK: Numeric

public extension Sequence where Element: Numeric {
    var sum: E {
        reduce(0, +)
    }
}


//public extension Strideable {
//    var string: Str {
//        return "\(self)"
//    }
//}
