


// MutValidUnitArrayT has its own impl-n of the funcs below
public protocol MutUnitArrayExtT: MutUnitArrayT {}

public extension MutUnitArrayExtT {
        
    /// returns true if any of the units were removed
    @discardableResult
    mutating func filtered(with cond: BoolCond) -> Bool {
        let a = len
        units = units.filter(cond)
        return a == len
    }
    
    /// if any of the conds filters out all units - empty array is saved without continuing (obvious)
    /// returns true if any of the units were removed
    @discardableResult
    mutating func filtered(with conds: [BoolCond]) -> Bool {
        if conds.isEmpty { // or crash?
            return false
        }
        let a = len
        units = units.filtering(with: conds) ?? []
        return a == len
    }
    
    /// if any of the conds filters out all units - empty array is saved without continuing (obvious)
    /// returns true if any of the units were removed
    @discardableResult
    mutating func filtered(with conds: BoolCond...) -> Bool {
        if conds.isEmpty { // or crash?
            return false
        }
        let a = len
        units = units.filtering(with: conds) ?? []
        return a == len
    }
    
    
    //MARK: -
    
    /// if any of the conds filters out all units - nil is returned without continuing (obvious)
    func filtering(with conds: [BoolCond]) -> [LU]? {
        if conds.isEmpty { // or crash?
            return nil
        }
        return conds.reduce(units, { $0.filter($1) }).sth
    }
    
    /// if any of the conds filters out all units - nil is returned without continuing (obvious)
    func filtering(with conds: BoolCond...) -> [LU]? {
        if conds.isEmpty { // or crash?
            return nil
        }
        return conds.reduce(units, { $0.filter($1) }).sth
    }
    
    //MARK: remove+cond
    
    /// If any of the conds is satisfied the unit is removed
    /// returns true if any were removed
    @discardableResult
    mutating func remove(while cond: BoolCond) -> Bool {
        
        L.notImpl()
//        if let a = units.removing(while: cond) {
//            units = a
//            return true
//        }
//        return false
    }
    
    
    /// (the returned array can be empty)
    func removing(while cond: BoolCond) -> [LU]? {
        
        let all = units.filter{!cond($0)}
        if len != all.len {
            return all
        }
        return nil
    }
    
    /// If any of the conds is satisfied the unit is removed
    /// (the returned array can be empty)
    func removing(whileAnyAreTrue conds: [BoolCond]) -> [LU]? {
        
        let all = units.drop(while: { item in
            conds.has{$0(item)} })
        if len != all.len {
            return all.array
        }
        return nil
    }
    
    /// If all of the conds is satisfied the unit is removed
    /// (the returned array can be empty)
    func removing(whileAllAreTrue conds: [BoolCond]) -> [LU]? {
        
        let all = units.drop(while: { item in
            conds.allSatisfy{ $0(item) }} )
        if len != all.len {
            return all.array
        }
        return nil
    }
    
    
    //MARK: -
    
    /// If all of the conds is satisfied the unit is removed
    /// returns true if any were removed
    @discardableResult
    mutating func remove(whileAllAreTrue conds: [BoolCond]) -> Bool {
        if let a = units.removing(whileAllAreTrue: conds) {
            units = a
            return true
        }
        return false
    }
    /// returns true if any were removed
    @discardableResult
    mutating func remove(whileAnyAreTrue conds: [BoolCond]) -> Bool {
        if let a = units.removing(whileAnyAreTrue: conds) {
            units = a
            return true
        }
        return false
    }
    
    
    //MARK: remove
    // it is a conv based on remove
    
    /// remove(whileAllAreTrue)
    /// returns true if any were removed
    //    @discardableResult
    //    mutating func remove(satisfying conds: [BoolCond]) -> Bool {
    //        return units.remove(whileAllAreTrue: conds)
    //    }
    //
    //
    //    /// returns new array
    //    /// (if its empty - returns nil)
    //    func removing(satisfying conds: [BoolCond]) -> [LU]? {
    //        return units.removing(whileAllAreTrue: conds)
    //    }
    //
    //    /// remove(while: cond)
    //    /// returns true if any were removed
    //    @discardableResult
    //    mutating func remove(satisfying cond: BoolCond) -> Bool {
    //        return units.remove(while: cond)
    //    }
    //
    //    /// removing(while: cond)
    //    /// returns new array
    //    /// (if its empty - returns nil)
    //    func removing(satisfying cond: BoolCond) -> [LU]? {
    //        return units.removing(while: cond)
    //    }}
}
