
//Equatable + HasIdx
public extension Array where Element: Equatable & HasIdxP {
    
    /// contains all
    /// range of this array
    func contains(all items: Array, in rng: Rng) -> Bool {
        units(in: rng)?.contains(all: items) == true
    }
    
    /// some -> maybe all!
    /// range of this array
    func contains(some items: Array, in rng: Rng) -> Bool {
        units(in: rng)?.contains(some: items) == true
    }
    
    /// range of this array
    func contains(no items: Array, in rng: Rng) -> Bool {
        !contains(some: items, in: rng)
    }
    
    /// contains all
    /// range of this array
    func has(all items: Array, in rng: Rng) -> Bool {
        contains(all: items, in: rng)
    }
    
    /// some -> maybe all!
    /// range of this array
    func has(some items: Array, in rng: Rng) -> Bool {
        contains(some: items, in: rng)
    }
    
    /// contains
    /// range of this array
    func has(no items: Array, in rng: Rng) -> Bool {
        contains(no: items, in: rng)
    }
    
    
    func containsDuplicates(in rng: Rng) -> Bool {
        removingDuplicates(in: rng) != nil
    }
    
    //MARK: filter indexes
    
    /// if any of the conds filters out all units - nil is returned without continuing (obvious)
    func filterIndexes(_ cond: BoolCond) -> [Int]? {
        filter(cond).indexes.sth
    }
    /// if any of the conds filters out all units - nil is returned without continuing (obvious)
    func filterIndexes(_ conds: [BoolCond]) -> [Int]? {
        filtering(with: conds)?.indexes
    }  
    /// if any of the conds filters out all units - nil is returned without continuing (obvious)
    func filterIndexes(_ conds: BoolCond...) -> [Int]? {
        filtering(with: conds)?.indexes
    }
    
    //MARK: indexes
    
    /// uses Equatable to check
    func indexes(of item: E,
                 in rng: Rng) -> [Int]? {
        units(in: rng)?.indexes(of: item)
    }
    
    //MARK: unique
    
    /// empty array can be returned
    func uniqued(in rng: Rng) -> Array? {
        units(in: rng)?.uniqued()
    }
}


//TODO: cond, matchCond
