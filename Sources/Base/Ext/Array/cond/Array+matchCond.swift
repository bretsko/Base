


//TODO: + Equatable, Hashable, HasIdxP, HasRngP
//Array+BoolCond
public extension Array {
    typealias MatchCond = (E, E) -> Bool
    
    //MARK: satisfy one cond
    
    /// true if - cond can match all units in this array to at least one unit in the other array
    func allSatisfy(_ other: Array,
                    _ matchCond: @escaping MatchCond) -> Bool {
        allSatisfy{ item1 in
            other.has{ matchCond($0, item1)}
        }
    }
    
    /// true if - cond can match some units in this array to at least one unit in the other array
    /// some -> maybe all!
    func someSatisfy(_ other: Array,
                     _ matchCond: MatchCond) -> Bool {
        contains { item1 in
            other.has{ matchCond($0, item1)}
        }
    }
    
    /// true if - cond cannot match any unit in this array to any unit in the other array
    func noneSatisfy(_ other: Array,
                     _ matchCond: MatchCond) -> Bool {
        return !someSatisfy(other,matchCond)
    }
    
    
    //MARK: satisfy all conds
    
    /// true if - can match with all conds - all units in this array to at least one unit in the other array
    func allSatisfy(_ other: Array,
                    _ matchConds: [MatchCond]) -> Bool {
        
        matchConds.allSatisfy{ cond  in
            self.allSatisfy{ item1 in
                other.has{ cond($0, item1) } }
        }
    }
    
    /// true if - can match with all conds - some units in this array to at least one unit in the other array
    /// some -> maybe all!
    func someSatisfy(_ other: Array,
                     _ matchConds: [MatchCond]) -> Bool {
        
        matchConds.allSatisfy{ cond  in
            self.has{ item1 in
                other.has{ cond($0, item1) } }
        }
    }
    
    /// true if - cannot match with all conds - any unit in this array to any unit in the other array
    func noneSatisfy(_ other: Array,
                     _ matchConds: [MatchCond]) -> Bool {
        return !someSatisfy(other,matchConds)
    }
    
    
    //MARK: Set funcs
    
    /// merges 2 arrays using the supplied predicate - appends only the unique part
    /// returns true if any were merged
    @discardableResult
    mutating func merge(_ other: Array,
                        _ matchCond: MatchCond) -> Bool {
        if let a = merging(other, matchCond) {
            self = a
            return true
        }
        return false
    }
    
    
    /// makes intersection using matchCond
    /// if the produced array is empty - returns false
    @discardableResult
    mutating func intersect(_ other: Array,
                            _ matchCond: MatchCond) -> Bool {
        if let common = intersecting(other, matchCond) {
            self = common
            return true
        }
        return false
    }
    
    /// returns only different units using matchCond to compare
    /// if the produced array is empty - returns false
    @discardableResult
    mutating func diff(_ other: Array,
                       _ matchCond: MatchCond) -> Bool {
        if let diff = diffing(other, matchCond) {
            self = diff
            return true
        }
        return false
    }
    
    /// makes intersection using matchCond
    /// returns only common units
    /// if the produced array is empty - returns nil
    func intersecting(_ other: Array,
                      _ matchCond: MatchCond) -> Array? {
        filter { item1 in
            other.has{ matchCond(item1, $0) } }.sth
    }
    
    /// returns only the units not found in the second array
    /// if the produced array is empty- returns nil
    func diffing(_ other: Array,
                 _ matchCond: MatchCond) -> Array? {
        filter { item1 in
            !other.has{matchCond(item1, $0) } }.sth
    }
    
    /// merges 2 arrays using the supplied predicate - appends only the unique part
    /// returns new array if any were merged
    func merging(_ other: Array,
                 _ matchCond: MatchCond) -> Array? {
        
        // add only unique
        if let diff = diffing(other, matchCond) {
            return self + diff
        } else {
            return nil
        }
    }
    
    
    //MARK: removeDuplicates
    
    /// strange func, why use it?
    /// leaves one item per cond  in current array
    /// returns true if any were removed
    @discardableResult
    mutating func removeDuplicates(satisfying conds: [MatchCond]) -> Bool {
        fatalError()
        //        let oldLen = len
        //        if let a = removingDuplicates {
        //            self = a
        //            return oldLen != len
        //        } else {
        //            return false
        //        }
    }
    
    /// returns new array if any were removed
    /// (if empty array was given it is returned)
    func removingDuplicates(satisfying conds: [MatchCond]) -> Array? {
        fatalError()
        //        let oldLen = len
        //        let a = reduce(into: Array()) {
        //            if !$0.contains($1) {
        //                $0.append($1) }}
        //        if a.len != oldLen {
        //            return a
        //        } else {
        //            return nil
        //        }
    }
    func containsDuplicates(satisfying conds: [MatchCond]) -> Bool {
        return removingDuplicates(satisfying:conds) != nil
    }
}



