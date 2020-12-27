

//Array+Equatable
public extension Array where Element: Equatable {
    
    
    //MARK: contains
    
    func contains(all items: Array) -> Bool {
        allSatisfy{items.contains($0)}
    }
    /// some -> maybe all!
    func contains(some items: Array) -> Bool {
        contains{items.contains($0)}
    }
    func contains(no items: Array) -> Bool {
        !contains(some:items)
    }
    
    
    /// contains
    func has(all items: Array) -> Bool {
        contains(all: items)
    }
    /// some -> maybe all!
    func has(some items: Array) -> Bool {
        contains(some:items)
    }
    /// contains
    func has(no items: Array) -> Bool {
        contains(no: items)
    }
    
    //MARK: prefix, suffix
    
    /// crashes if supplied array is empty
    func has(prefix: Array) -> Bool {
        crashIf(prefix.isEmpty)
        return isEmpty || starts(with: prefix)
    }
    
    /// crashes if supplied array is empty
    func has(suffix: Array) -> Bool {
        crashIf(suffix.isEmpty)
        return isEmpty || reversed().starts(with: suffix)
    }
    
    
    //MARK: - indexes
    
    func indexes(of item: E) -> [Int]? {
        indices.filterSth { self[$0] == item }
    }
    
    func indexes(of items: Array) -> [Int]? {
        indices.filterSth {
            items.contains(self[$0])
        }
    }
    
    //MARK: - count
    
    func count(_ units: Array) -> Int {
        //TODO: try use reduce
        
        var c = 0
        units.forEach {
            for x in self where $0 == x {
                c += 1
            }
        }
        return c
    }
    func count(_ units: E...) -> Int {
        count(units)
    }
    
    //MARK: probability
    
    func probability(of units: Array) -> Double {
        hasSth ? count(units).d / len.d : 0
    }
    func probability(of units: E...) -> Double {
        probability(of: units)
    }
    
    /// probability of getting the given Elements
    /// uses a block to determine the member state of a condition.
    func probability(execute block: @escaping BoolCond) -> Double {
        
        guard hasSth else {
            return 0
        }
        var c = 0
        forEach {
            if block($0) { c += 1 }
        }
        return c.d / len.d
    }
    
    
    func expectedValue(numTrials: Int,
                       for units: Array) -> Double {
        numTrials.d * probability(of: units)
    }
    func expectedValue(numTrials: Int,
                       for units: E...) -> Double {
        expectedValue(numTrials: numTrials, for: units)
    }
    
    
    //MARK: unique
    
    /// appends if doesnt contain the given unit
    @discardableResult
    mutating func append(unique: E) -> Bool {
        guard !contains(unique) else {
            return false
        }
        append(unique)
        return true
    }
    
    /// appends all unique units
    @discardableResult
    mutating func append(uniques: Array) -> Bool {
        var added = true
        uniques.forEach {
            let r = append(unique: $0)
            if r == false {
                added = r
            }
        }
        return added
    }
    
    var containsDuplicates: Bool {
        len != uniqued().len
    }
    var hasDuplicates: Bool {
        containsDuplicates
    }
    
    /// order is preserved
    /// empty array can be returned
    func uniqued() -> Array {
        var all = Array()
        forEach {
            if !all.contains($0) {
                all += [$0]
            }
        }
        return all
    }
    
    var hasEqualObjs: Bool {
        len != uniqued().len
    }
    
    //MARK: group
    
    /// grouped into equal units
    var groupedIntoEquals: [Array]? {
        grouped(with: { $0 == $1 })
    }
    
    /// grouped into equal
    func grouped(with matchBlock: (E,E) -> Bool) -> [Array]? {
        
        var groups = [Array]()
        
        forEach { unit1 in
            
            for unit2 in self where matchBlock(unit1, unit2) {
                
                // find group or create new
                if let i = groups.firstIndex(where: { group in
                    group.contains(where: { gunit in
                        matchBlock(unit1, gunit)
                    })
                }) {
                    groups[i].append(uniques: [unit1, unit2])
                    
                } else {
                    groups.append([unit1, unit2])
                }
            }
        }
        return groups.sth
    }
    
    
    //    func firstIdx(of item: E) -> Int? {
    //        return firstIndex(of: item)
    //        //        for (i, v) in `lazy`.enumerated() {
    //        //            if v == item {
    //        //                return i
    //        //            }
    //        //        }
    //        //        return nil
    //    }
    //
    //    func lastIdx(of item: E) -> Int? {
    //        return lastIndex(of: item)
    //        //        for (i, v) in reversed().lazy.enumerated() {
    //        //            if v == item {
    //        //                return count - 1 - i
    //        //            }
    //        //        }
    //        //        return nil
    //    }
    
    /**
     Slices a out a segment of an array based on the start
     and end positions.
     - Parameter start: A start idx.
     - Parameter end: An end idx.
     - Returns: A segmented array based on the start and end
     indices.
     */
    //    func slice(start: Int, end: Int?) -> Array {
    //        var e = end ?? count - 1
    //        if e >= count {
    //            e = count - 1
    //        }
    //
    //        guard -1 < start else {
    //            fatalError("Range out of bounds for \(start) - \(end ?? 0), should be 0 - \(count).")
    //        }
    //
    //        var diff = abs(e - start)
    //        guard count > diff else {
    //            return self
    //        }
    //
    //        var ret = Array()
    //        while -1 < diff {
    //            ret.insert(self[start + diff], at: 0)
    //            diff -= 1
    //        }
    //
    //        return ret
    //    }
}


