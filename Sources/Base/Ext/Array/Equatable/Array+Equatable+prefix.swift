

//Array+Equatable
public extension Array where Element: Equatable {
    
    //MARK: unique
    
    /// empty array can be returned
    func uniqueElementsInPrefix(prefixLentgh: Int = Int.max) -> Array {
        var all = Array()
        forEach { 
            if !all.contains($0) {
                all += [$0]
            }
        }
        return all
    }
    
    //MARK: contains
    
    /// contains all
    func containsInPrefix(prefixLentgh: Int = Int.max,
                          _ items: Array) -> Bool {
        allSatisfy{items.contains($0)}
    }
    /// some -> maybe all!
    func containsInPrefix(prefixLentgh: Int = Int.max,
                          some items: Array) -> Bool {
        contains{items.contains($0)}
    }
    func containsInPrefix(prefixLentgh: Int = Int.max,
                          no items: Array) -> Bool {
        return !contains(some:items)
    }
    
    
    /// contains
    func hasInPrefix(prefixLentgh: Int = Int.max,
                     _ items: Array) -> Bool {
        contains(items)
    }
    /// some -> maybe all!
    func hasInPrefix(prefixLentgh: Int = Int.max,
                     some items: Array) -> Bool {
        contains(some:items)
    }
    /// contains
    func hasInPrefix(prefixLentgh: Int = Int.max,
                     no items: Array) -> Bool {
        contains(no: items)
    }
    
    //MARK: prefix, suffix
    
    /// crashes if supplied array is empty
    //    func has(prefix: Array) -> Bool {
    //        crashIf(prefix.isEmpty)
    //        isEmpty ?? starts(with: prefix)
    //    }
    //
    //    /// crashes if supplied array is empty
    //    func has(suffix: Array) -> Bool {
    //        crashIf(suffix.isEmpty)
    //        isEmpty ?? reversed().starts(with: suffix)
    //    }
    
    //MARK: count
    
    func countInPrefix(num: Int = Int.max,
                       of units: E...) -> Int {
        count(units)
    }
    
    func countInPrefix(num: Int = Int.max,
                       units: [E]) -> Int {
        var c = 0
        units.forEach {
            for x in self where $0 == x {
                c += 1
            }
        }
        return c
    }
    
    //MARK: indexes
    
    func indexesInPrefix(num: Int = Int.max,
                         of item: E) -> [Int]? {
        var indexes: [Int] = []
        indices.forEach { i in
            if self[i] == item {
                indexes.append(i)
            }
        }
        return indexes.sth
    }
}


