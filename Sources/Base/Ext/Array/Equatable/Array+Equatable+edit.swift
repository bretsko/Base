

//Array+Equatable
public extension Array where Element: Equatable {
    
    
    //MARK: - addUnique
    
    /// union, merge, insert
    /// returns false if some were not added
    @discardableResult
    mutating func addUnique(_ items: Array) -> Bool {
        
        guard items.hasSth else {
            return false
        }
        var added = true
        for item in items {
            if !contains(item) {
                append(item)
            } else {
                added = false
            }
        }
        return added
    }
    
    /// union, merge, insert
    /// returns nil if none were added
    func addingUnique(_ units: Array) -> Array? {
        var a = self
        if a.addUnique(units) {
            return a
        }
        return nil
    }
    
    /// union, merge, insert
    /// returns true if any were added
    @discardableResult
    mutating func merge(with units: Array) -> Bool {
        addUnique(units)
    }
    /// union, merge, insert
    /// returns nil if none were added
    func merging(with units: Array) -> Array? {
        addingUnique(units)
    }
    
    /// union, merge, insert
    /// returns true if any were added
    @discardableResult
    mutating func insert(with units: Array) -> Bool {
        addUnique(units)
    }
    /// union, merge, insert
    /// returns nil if none were added
    func inserting(with units: Array) -> Array? {
        addingUnique(units)
    }
    
    
    //MARK: remove many
    
    /// returns removed items
    @discardableResult
    mutating func remove(_ items: Array) -> Array? {
        var removed = Array()
        items.forEach {
            if let a = remove($0) {
                removed.append(a)
            }
        }
        return removed.sth
    }
    
    @discardableResult
    mutating func remove(_ items: E...) -> Array? {
        remove(items)
    }
    
    /// returns new array
    /// (if its empty - returns nil)
    func removing(_ items: Array) -> Array? {
        var a = self
        a.remove(items)
        return a.sth
    }
    
    
    //MARK: - remove single
    
    /// returns removed item
    @discardableResult
    mutating func remove(_ item: E) -> E? {
        //self = filter { $0 != item }
        guard let idx = firstIndex(of: item) else { return nil }
        return remove(at: idx)
    }
    
    
    /// returns new array
    /// (if its empty - returns nil)
    func removing(_ item: E) -> Array? {
        var a = self
        a.remove(item)
        return a.sth
    }
    
    
    //MARK: - replace
    
    func replacing(_ unit1: E,
                   with unit2: E) -> Array? {
        var new = self
        guard let i = indices.first(where: { i in
                                        self[i] == unit1 }) else {
            return nil
        }
        new[i] = unit2
        return new
    }
    
    @discardableResult
    mutating func replace(_ unit1: E,
                          with unit2: E) -> Bool {
        if let a = replacing(unit1, with:unit2) {
            self = a
            return true
        }
        return false
    }
    
    
    
    func replacing(_ units1: Array,
                   with units2: Array) -> Array? {
        crashIf(len < units1.len || units1.len != units2.len)
        
        var new = self
        var changed = false
        indices.forEach { i1 in
            
            if let i2 = units1.indices.first(where: { i2 in
                self[i1] == units1[i2]
            }) {
                
                new[i1] = units2[i2]
                changed = true
            }
        }
        return changed ? new : nil
    }
    
    func replacing(_ units1: Array,
                   with units2: Array,
                   using matchCond: MatchCond) -> Array? {
        crashIf(len < units1.len || units1.len != units2.len)
        
        var new = self
        var changed = false
        indices.forEach { i1 in
            
            if let i2 = units1.indices.first(where: { i2 in
                matchCond(self[i1], units1[i2])
            }) {
                
                new[i1] = units2[i2]
                changed = true
            }
        }
        return changed ? new : nil
    }
    
    @discardableResult
    mutating func replace(_ units1: Array,
                          with units2: Array) -> Bool {
        if let a = replacing(units1, with:units2) {
            self = a
            return true
        }
        return false
    }
    @discardableResult
    mutating func replace(_ units1: Array,
                          with units2: Array,
                          using matchCond: MatchCond) -> Bool {
        if let a = replacing(units1, with:units2, using: matchCond) {
            self = a
            return true
        }
        return false
    }
    
    
    //MARK: duplicates
    
    /// returns true if any were removed
    @discardableResult
    mutating func removeDuplicates() -> Bool {
        let oldLen = len
        if let a = removingDuplicates {
            self = a
            return oldLen != len
        }
        return false
        
    }
    
    /// returns new array if any were removed
    /// (if empty array was given it is returned)
    var removingDuplicates: Array? {
        let oldLen = len
        let a = reduce(into: Array()) {
            if !$0.contains($1) {
                $0.append($1) }}
        if a.len != oldLen {
            return a
        }
        return nil
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


