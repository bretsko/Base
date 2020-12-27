

public extension Set {
    
    var array: [E] {
        get {
            [E](self)
        }
        set {
            self = Set(newValue)
        }
    }
    
    //MARK: filter
    
//    func filterSth(_ conds: [BoolCond]) -> Set? {
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
    
//    func filterSth(_ conds: BoolCond...) -> Set? {
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
    
    //MARK: -
    
    func contains(_ items: Set) -> Bool {
        isSuperset(of: items)
    }
    /// some -> maybe all!
    func contains(some items: Set) -> Bool {
        !isDisjoint(with: items)
    }
    func contains(no items: Set) -> Bool {
        isDisjoint(with: items)
    }  
    
    /// contains
    func has(_ items: Set) -> Bool {
        contains(items)
    }
    /// some -> maybe all!
    func has(some items: Set) -> Bool {
        contains(some:items)
    }
    /// contains
    func has(no items: Set) -> Bool {
        contains(no: items)
    }
    
    
    //MARK: insert
    
    /// union, merge, insert
    /// returns true if any were added
    @discardableResult
    mutating func insert(_ units: Set) -> Bool {
        if units.isEmpty {
            return false
        }
        let a = len
        self.formUnion(units)
        return a == len
    }
    /// union, merge, insert
    /// returns true if any were added
    @discardableResult
    mutating func insert(_ units: [E]) -> Bool {
        insert(units.set)
    }
    /// union, merge, insert
    /// returns true if any were added
    @discardableResult
    mutating func insert(_ units: E...) -> Bool {
        insert(units.set)
    }
    
    /// union, merge, insert
    /// returns nil if failed
    func inserting(_ units: Set) -> Set? {
        var a = self
        if a.insert(units) {
            return a
        }
        return nil
    }
    /// union, merge, insert
    /// returns nil if failed
    func inserting(_ units: [E]) -> Set? {
        inserting(units.set)
    }
    /// union, merge, insert
    /// returns nil if failed
    func inserting(_ units: E...) -> Set? {
        inserting(units.set)
    }
    
    //MARK: remove / subtract
    
    /// subtract, remove
    /// returns true if any were removed
    @discardableResult
    mutating func remove(_ units: Set) -> Bool {
        if units.isEmpty {
            return false
        }
        let a = len
        subtract(units)
        return a == len
    }
    /// subtract, remove
    /// returns true if any were removed
    @discardableResult
    mutating func remove(_ units: [E]) -> Bool {
        remove(units.set)
    }
    /// subtract, remove
    /// returns true if any were removed
    @discardableResult
    mutating func remove(_ units: E...) -> Bool {
        remove(units.set)
    }
    
    /// subtract, remove
    /// returns nil if failed
    func removing(_ units: Set) -> Set? {
        var a = self
        if a.remove(units) {
            return a
        }
        return nil
    }
    /// subtract, remove
    /// returns nil if failed
    func removing(_ units: [E]) -> Set? {
        removing(units.set)
    }
    /// subtract, remove
    /// returns nil if failed
    func removing(_ units: E...) -> Set? {
        removing(units.set)
    }
    
    //MARK: replace
    
    /// if removing or inserting failed - returns nil
    func replacing(_ unit1: E,
                   with unit2: E) -> Set? {
        var new = self
        if new.remove(unit1) != nil,
           new.insert(unit2).inserted {
            return new
        }
        return nil
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
    
    
    /// first removes, then inserts
    func replacing(_ units1: Set,
                   with units2: Set) -> Set? {
        crashIf(len < units1.len || units1.len != units2.len)
        
        var new = self
        if new.remove(units1),
           new.insert(units2) {
            return new
        }
        return nil
    }
    
    /// first removes, then inserts
    @discardableResult
    mutating func replace(_ units1: Set,
                          with units2: Set) -> Bool {
        if let a = replacing(units1, with:units2) {
            self = a
            return true
        }
        return false
    }
    
    
    //MARK: merge
    
    
    /// union, merge, insert
    /// returns true if any were added
    @discardableResult
    mutating func merge(with units: Set) -> Bool {
        insert(units)
    }
    
    /// union, merge, insert
    /// returns nil if failed
    func merging(with units: Set) -> Set? {
        inserting(units)
    }
}
