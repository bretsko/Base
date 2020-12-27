
//@_exported import Log


//TODO: + Equatable, Hashable, HasIdxP, HasRngP
//Array+BoolCond
public extension Array where Element: HasIdxP {
    

    //MARK: remove+cond
    
    /// returns nil if doesnt have any items in this rng
    func removing(while cond: BoolCond,
                  in rng: Rng) -> Array? {
         units(in: rng)?.filter { !cond($0) }
    }
    
    /// If any of the conds is satisfied the unit is removed
    /// (the returned array can be empty)
    func removing(whileAnyAreTrue conds: [BoolCond],
                  in rng: Rng) -> Array? {
         units(in: rng)?.removing(whileAnyAreTrue:conds)
    }
    
    /// If all of the conds is satisfied the unit is removed
    /// (the returned array can be empty)
    func removing(whileAllAreTrue conds: [BoolCond],
                  in rng: Rng) -> Array? {
         units(in: rng)?.removing(whileAllAreTrue:conds)
    }
    
    
    /// If any of the conds is satisfied the unit is removed
    /// returns true if any were removed
    @discardableResult
    mutating func remove(while cond: BoolCond,
                         in rng: Rng) -> Bool {
//        guard var a = units(in: rng) else {
//            return false
//        }
        L.notImpl()
        //WRONG - need to combine 2 parts!
        // let b = unitsExcept(in: rng)
        
        //        if a.drop(while:cond) {
        //            self = a
        //            return true
        //        }
        //        return false
    }
    
    
    /// If all of the conds is satisfied the unit is removed
    /// returns true if any were removed
    @discardableResult
    mutating func remove(whileAllAreTrue conds: [BoolCond],
                         in rng: Rng) -> Bool {
//        guard var a = units(in: rng) else {
//            return false
//        }
        
        L.notImpl()
        //WRONG - need to combine 2 parts!
        // let b = unitsExcept(in: rng)
        
        //        if a.remove(whileAllAreTrue:conds) {
        //            self = a
        //            return true
        //        }
        //        return false
    }
    /// returns true if any were removed
    @discardableResult
    mutating func remove(whileAnyAreTrue conds: [BoolCond],
                         in rng: Rng) -> Bool {
//        guard var a = units(in: rng) else {
//            return false
//        }
        L.notImpl()
        //WRONG - need to combine 2 parts!
        // let b = unitsExcept(in: rng)
        
        //        if a.remove(whileAnyAreTrue:conds) {
        //            self = a
        //            return true
        //        }
        //        return false
    }
    
    

    //MARK: remove
    // it is a conv based on remove
    
    
    //TODO: satisfyingSome, satisfyingNone
    
    /// remove(whileAllAreTrue)
    /// returns true if any were removed
    @discardableResult
    mutating func remove(satisfying conds: [BoolCond],
                         in rng: Rng) -> Bool {
//        guard var a = units(in: rng) else {
//            return false
//        }
        L.notImpl()
        //WRONG - need to combine 2 parts!
        // let b = unitsExcept(in: rng)
        //        if a.remove(satisfying:conds) {
        //            self = a
        //            return true
        //        }
        //        return false
    }
    
    
    /// returns new array
    /// (if its empty - returns nil)
    func removing(satisfying conds: [BoolCond],
                  in rng: Rng) -> Array? {
        L.notImpl()
        //WRONG - need to combine 2 parts!
        // let b = unitsExcept(in: rng)
        
        //return units(in: rng)?.removing(satisfying:conds)
    }
    
    /// remove(while: cond)
    /// returns true if any were removed
    @discardableResult
    mutating func remove(satisfying cond: BoolCond,
                         in rng: Rng) -> Bool {
        
//        guard var a = units(in: rng) else {
//            return false
//        }
        L.notImpl()
        //WRONG - need to combine 2 parts!
        // let b = unitsExcept(in: rng)
        
        //        if a.remove(satisfying:cond) {
        //            self = a
        //            return true
        //        }
        //        return false
    }
    
    /// removing(while: cond)
    /// returns new array
    /// (if its empty - returns nil)
    func removing(satisfying cond: BoolCond,
                  in rng: Rng) -> Array? {
        L.notImpl()
        //WRONG - need to combine 2 parts!
        // let b = unitsExcept(in: rng)
        
        //return units(in: rng)?.removing(satisfying:cond)
    }
}




//TODO: + Equatable, Hashable, HasIdxP, HasRngP
//Array+BoolCond
public extension Array where Element: HasIdxP {
    
    
    //MARK: rng
    
    func indexes(where cond: BoolCond,
                 in rng: Rng) -> [Int]? {
         units(in: rng)?.indexes(where:cond)
    }
    func indexes(satisfyingAll conds: [BoolCond],
                 in rng: Rng) -> [Int]? {
         units(in: rng)?.indexes(satisfyingAll:conds)
    }
    //TODO: satisfyingSome, satisfyingNone
    
    //MARK: count
    
    /// returns nil if doesnt have any items in this rng
    func count(_ cond: BoolCond, in rng: Rng) -> Int? {
         units(in: rng)?.count(cond)
    }
}
