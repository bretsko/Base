


//Array+Hashable
public extension Array where Element: Hashable {
    
    //MARK: addUnique
    
    /// union, merge
    /// returns true if any were added
    @discardableResult
    mutating func addUnique(_ units: Array) -> Bool {
        if units.isEmpty {
            return false
        }
        let a = len
        self = set.union(units.set).array
        return a == len
    }
    
    /// union, merge
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
        return addUnique(units)
    }
    /// union, merge, insert
    /// returns nil if none were added
    func merging(with units: Array) -> Array? {
        return addingUnique(units)
    }
    
    
    /// union, merge, insert
    /// returns true if any were added
    @discardableResult
    mutating func insert(with units: Array) -> Bool {
        return addUnique(units)
    }
    /// union, merge, insert
    /// returns nil if none were added
    func inserting(with units: Array) -> Array? {
        return addingUnique(units)
    }
    
    //MARK: removing
    
    /// a new set has units that are not present in the other
    /// returns true if any were found common
    @discardableResult
    mutating func remove(_ units: Array) -> Bool {
        if units.isEmpty {
            return false
        }
        let a = len
        self = set.subtracting(units.set).array
        return a == len
    }
    
    /// a new set has units that are common to both arrays
    /// returns nil if failed
    func removing(_ units: Array) -> Array? {
        var a = self
        if a.remove(units) {
            return a
        }
        return nil
    }
    
    
    //MARK: Set funcs
    
    /// a new set has units that are common to both arrays
    /// returns true if any were found common
    @discardableResult
    mutating func intersection(_ units: Array) -> Bool {
        if units.isEmpty {
            return false
        }
        let a = len
        self = set.intersection(units.set).array
        return a == len
    }
    
    /// a new set has units that are common to both arrays
    /// returns nil if failed
    func intersecting(_ units: Array) -> Array? {
        var a = self
        if a.intersection(units) {
            return a
        }
        return nil
    }
    
    
    /// eliminates any common units and merges the rest
    /// (new set has units that are either in this array or in the given array, but not in both)
    /// returns true if any such were found
    @discardableResult
    mutating func symmetricDiff(_ units: Array) -> Bool {
        if units.isEmpty {
            return false
        }
        let a = len
        self = set.symmetricDifference(units.set).array
        return a == len
    }
    
    
    /// eliminates any common units and merges the rest
    /// (new set has units that are either in this array or in the given array, but not in both)
    /// returns nil if failed
    func makeSymmetricDiff(_ units: Array) -> Array? {
        var a = self
        if a.symmetricDiff(units) {
            return a
        }
        return nil
    }
    
    
    //TODO: more Set funcs
}








