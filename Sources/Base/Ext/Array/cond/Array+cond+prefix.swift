


//TODO: + Equatable, Hashable, HasIdxP, HasRngP
//Array+BoolCond
public extension Array {
    
    //MARK: filter indexes
    
    
    func indexesInPrefix(num: Int = Int.max,
                         satisfying cond: BoolCond) -> [Int]? {
        enumerated().map { i, a in
            cond(a) ? i : nil
        }.compactMap{$0}.sth
    }
    
    func indexesInPrefix(num: Int = Int.max,
                         satisfyingAll conds: [BoolCond]) -> [Int]? {
        enumerated().map { i, a in
            conds.allSatisfy{ $0(a) } ? i : nil
        }.compactMap{$0}.sth
    }
    
    /// some -> maybe all!
    func indexesInPrefix(num: Int = Int.max,
                         satisfyingSome conds: [BoolCond]) -> [Int]? {
        enumerated().map { i, a in
            conds.has{ $0(a) } ? i : nil
        }.compactMap{$0}.sth
    }
    
    func indexesInPrefix(num: Int = Int.max,
                         satisfyingNone conds: [BoolCond]) -> [Int]? {
        enumerated().map { i, a in
            conds.allSatisfy{ $0(a) == false} ? i : nil
        }.compactMap{$0}.sth
    }
    
    
    //MARK: count
    
    func countInPrefix(num: Int = Int.max,
                       _ cond: BoolCond) -> Int {
        filter{cond($0)}.len
    }
    
    func countInPrefix(num: Int = Int.max,
                       satisfyingAll conds: [BoolCond]) -> Int {
        indexes(satisfyingAll: conds)?.len ?? 0
    }
    /// some -> maybe all!
    func countInPrefix(num: Int = Int.max,
                       satisfyingSome conds: [BoolCond]) -> Int {
        indexes(satisfyingSome: conds)?.len ?? 0
    }
    
    func countInPrefix(num: Int = Int.max,
                       satisfyingNone conds: [BoolCond]) -> Int {
        indexes(satisfyingNone: conds)?.len ?? 0
    }
    
    
    
    //MARK: -
    
    //    func noneSatisfy(_ cond: @escaping BoolCond) -> Bool {
    //        return !allSatisfy{cond($0)}
    //    }
    //    /// some -> maybe all!
    //    func someSatisfy(_ cond: BoolCond) -> Bool {
    //        has{cond($0)})
    //    }
    //    /// some -> maybe all!
    //    func someNotSatisfy(_ cond: BoolCond) -> Bool {
    //        return !someSatisfy(cond)
    //    }
    //
    //    //MARK: -
    //
    //    func allSatisfy(_ conds: [BoolCond]) -> Bool {
    //        if conds.isEmpty { // or crash?
    //            return false
    //        }
    //        return allSatisfy{ unit in
    //            conds.allSatisfy { $0(unit) }
    //        }
    //    }
    //    /// some -> maybe all!
    //    /// maybe all!
    //    func someSatisfy(_ conds: [BoolCond]) -> Bool {
    //        if conds.isEmpty { // or crash?
    //            return false
    //        }
    //        return has{  unit in
    //            conds.has{ $0(unit) }
    //        })
    //    }
    //    func noneSatisfy(_ conds: [BoolCond]) -> Bool {
    //        return !someSatisfy(conds)
    //    }
    //    /// some -> maybe all!
    //    /// maybe all!
    //    func someNotSatisfy(_ conds: [BoolCond]) -> Bool {
    //        if conds.isEmpty { // or crash?
    //            return false
    //        }
    //        return has{  unit in
    //            conds.has{ $0(unit) == false }
    //        })
    //    }
    //
    //    //MARK: -
    //
    //    func allSatisfy(_ conds: BoolCond...) -> Bool {
    //        if conds.isEmpty { // or crash?
    //            return false
    //        }
    //        return allSatisfy{ unit in
    //            conds.allSatisfy{ $0(unit) }
    //        }
    //    }
    //    /// some -> maybe all!
    //    func someSatisfy(_ conds: BoolCond...) -> Bool {
    //        if conds.isEmpty { // or crash?
    //            return false
    //        }
    //        return has{  unit in
    //            conds.has{ $0(unit) }
    //        })
    //    }
    //    func noneSatisfy(_ conds: BoolCond...) -> Bool {
    //        return !someSatisfy(conds)
    //    }
    //
    //    /// some -> maybe all!
    //    func someNotSatisfy(_ conds: BoolCond...) -> Bool {
    //        if conds.isEmpty { // or crash?
    //            return false
    //        }
    //        return has{  unit in
    //            conds.has{ $0(unit) == false }
    //        })
    //    }
    //
    //
}
