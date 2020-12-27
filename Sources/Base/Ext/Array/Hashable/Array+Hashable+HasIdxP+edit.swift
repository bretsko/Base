



//Array+Hashable
public extension Array where Element: Hashable & HasIdxP {
    
    
    //MARK: addUnique
    
    /// returns true if any were added
    @discardableResult
    mutating func addUnique(_ units: Set<E>) -> Bool {
        if units.isEmpty {
            return false
        }
        let a = len
        self = set.union(units).array
        return a == len
    }
    
    /// returns nil if none were added
    func addingUnique(_ units: Set<E>) -> Array? {
        var a = self
        if a.addUnique(units) {
            return a
        }
        return nil
    }
    
    
    //MARK: removing
    
    /// a new set has units that are not present in the other
    /// returns true if any were found common
    @discardableResult
    mutating func remove(_ units: Set<E>) -> Bool {
        if units.isEmpty {
            return false
        }
        let a = len
        self = set.subtracting(units).array
        return a == len
    }
    
    /// a new set has units that are common to both arrays
    /// returns nil if failed
    func removing(_ units: Set<E>) -> Array? {
        var a = self
        if a.remove(units) {
            return a
        }
        return nil
    }
    
    
    //MARK: intersection
    
    /// a new set has units that are common to both arrays
    /// returns true if any were found common
    @discardableResult
    mutating func intersection(_ units: Set<E>) -> Bool {
        if units.isEmpty {
            return false
        }
        let a = len
        self = set.intersection(units).array
        return a == len
    }
    
    /// a new set has units that are common to both arrays
    /// returns nil if failed
    func intersecting(_ units: Set<E>) -> Array? {
        var a = self
        if a.intersection(units) {
            return a
        }
        return nil
    }
    
    //MARK: symmetricDifference
    
    /// eliminates any common units and merges the rest
    /// (new set has units that are either in this array or in the given array, but not in both)
    /// returns true if any such were found
    @discardableResult
    mutating func symmetricDiff(_ units: Set<E>) -> Bool {
        if units.isEmpty {
            return false
        }
        let a = len
        self = set.symmetricDifference(Set(units)).array
        return a == len
    }
    
    
    /// eliminates any common units and merges the rest
    /// (new set has units that are either in this array or in the given array, but not in both)
    /// returns nil if failed
    func makeSymmetricDiff(_ units: Set<E>) -> Array? {
        var a = self
        if a.symmetricDiff(units) {
            return a
        }
        return nil
    }
    
    //TODO: contains items at indices ?
    
    
    //TODO: more Set funcs
}


//TODO: cond, matchCond






