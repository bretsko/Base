


//TODO: + Equatable, Hashable, HasIdxP, HasRngP
//Array+BoolCond
public extension Array {
    
    //MARK: -
    
    /// returns true if any of the units were removed
    @discardableResult
    mutating func filtered(with cond: BoolCond) -> Bool {
        let a = len
        self = filter(cond)
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
        self = filtering(with: conds) ?? []
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
        self = filtering(with: conds) ?? []
        return a == len
    }
    
    
    //MARK: -
    
    /// if any of the conds filters out all units - nil is returned without continuing (obvious)
    func filtering(with conds: [BoolCond]) -> Array? {
        if conds.isEmpty { // or crash?
            return nil
        }
        return conds.reduce(self, { $0.filter($1) }).sth
    }
    
    /// if any of the conds filters out all units - nil is returned without continuing (obvious)
    func filtering(with conds: BoolCond...) -> Array? {
        if conds.isEmpty { // or crash?
            return nil
        }
        return conds.reduce(self, { $0.filter($1) }).sth
    }
    
    //MARK: remove+cond
    
    /// If any of the conds is satisfied the unit is removed
    /// returns true if any were removed
    @discardableResult
    mutating func remove(while cond: BoolCond) -> Bool {
        if let a = removing(while: cond) {
            self = a
            return true
        }
        return false
    }
    
    
    /// (the returned array can be empty)
    func removing(while cond: BoolCond) -> Array? {
        
        let all = filter{!cond($0)}
        if len != all.len {
            return all
        }
        return nil
    }
    
    /// If any of the conds is satisfied the unit is removed
    /// (the returned array can be empty)
    func removing(whileAnyAreTrue conds: [BoolCond]) -> Array? {
        
        let all = drop(while: { item in
                        conds.has{$0(item)} })
        if len != all.len {
            return all.array
        }
        return nil
    }
    
    /// If all of the conds is satisfied the unit is removed
    /// (the returned array can be empty)
    func removing(whileAllAreTrue conds: [BoolCond]) -> Array? {
        
        let all = drop(while: { item in
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
        if let a = removing(whileAllAreTrue: conds) {
            self = a
            return true
        }
        return false
    }
    /// returns true if any were removed
    @discardableResult
    mutating func remove(whileAnyAreTrue conds: [BoolCond]) -> Bool {
        if let a = removing(whileAnyAreTrue: conds) {
            self = a
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
    //        return remove(whileAllAreTrue: conds)
    //    }
    //
    //
    //    /// returns new array
    //    /// (if its empty - returns nil)
    //    func removing(satisfying conds: [BoolCond]) -> Array? {
    //        return removing(whileAllAreTrue: conds)
    //    }
    //
    //    /// remove(while: cond)
    //    /// returns true if any were removed
    //    @discardableResult
    //    mutating func remove(satisfying cond: BoolCond) -> Bool {
    //        return remove(while: cond)
    //    }
    //
    //    /// removing(while: cond)
    //    /// returns new array
    //    /// (if its empty - returns nil)
    //    func removing(satisfying cond: BoolCond) -> Array? {
    //        return removing(while: cond)
    //    }}
}
