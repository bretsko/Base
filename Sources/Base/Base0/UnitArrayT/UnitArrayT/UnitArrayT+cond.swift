


public extension UnitArrayT {
    
    func none(satisfy cond: @escaping BoolCond) -> Bool {
        !units.allSatisfy{cond($0)}
    }
    /// some -> maybe all!
    func has(_ cond: BoolCond) -> Bool {
        units.contains(where: { cond($0) })
    }
    
    /// some -> maybe all!
    func some(satisfy cond: BoolCond) -> Bool {
        units.has{cond($0)}
    }
    
    /// some -> maybe all!
    func some(notSatisfy cond: BoolCond) -> Bool {
        !units.some(satisfy: cond)
    }
    
    
    //MARK: -
    
    func all(satisfy conds: [BoolCond]) -> Bool {
        if conds.isEmpty { // or crash?
            return false
        }
        return units.allSatisfy{ unit in
            conds.allSatisfy { $0(unit) }
        }
    }
    /// some -> maybe all!
    /// maybe all!
    func some(satisfy conds: [BoolCond]) -> Bool {
        if conds.isEmpty { // or crash?
            return false
        }
        return units.has{  unit in
            conds.has{ $0(unit) }
        }
    }
    func none(satisfy conds: [BoolCond]) -> Bool {
        return !units.some(satisfy: conds)
    }
    /// some -> maybe all!
    /// maybe all!
    func some(notSatisfy conds: [BoolCond]) -> Bool {
        if conds.isEmpty { // or crash?
            return false
        }
        return units.has{  unit in
            conds.has{ $0(unit) == false }
        }
    }
    
    //MARK: -
    
    func all(satisfy conds: BoolCond...) -> Bool {
        if conds.isEmpty { // or crash?
            return false
        }
        return units.allSatisfy{ unit in
            conds.allSatisfy{ $0(unit) }
        }
    }
    /// some -> maybe all!
    func some(satisfy conds: BoolCond...) -> Bool {
        if conds.isEmpty { // or crash?
            return false
        }
        return units.has { unit in
            conds.has{ $0(unit) }
        }
    }
    func none(satisfy conds: BoolCond...) -> Bool {
        return !units.some(satisfy: conds)
    }
    
    /// some -> maybe all!
    func some(notSatisfy conds: BoolCond...) -> Bool {
        if conds.isEmpty { // or crash?
            return false
        }
        return units.has { unit in
            conds.has{ $0(unit) == false }
        }
    }
    
    //MARK: filter indexes
    
    
    func indexes(satisfying cond: BoolCond) -> [Int]? {
        units.enumerated().map { i, a in
            cond(a) ? i : nil
        }.compactMap{$0}.sth
    }
    
    func indexes(satisfyingAll conds: [BoolCond]) -> [Int]? {
        units.enumerated().map { i, a in
            conds.allSatisfy{ $0(a) } ? i : nil
        }.compactMap{$0}.sth
    }
    
    /// some -> maybe all!
    func indexes(satisfyingSome conds: [BoolCond]) -> [Int]? {
        units.enumerated().map { i, a in
            conds.has{ $0(a) } ? i : nil
        }.compactMap{$0}.sth
    }
    
    func indexes(satisfyingNone conds: [BoolCond]) -> [Int]? {
        units.enumerated().map { i, a in
            conds.allSatisfy{ $0(a) == false} ? i : nil
        }.compactMap{$0}.sth
    }
    
    
    //MARK: count
    
    func count(_ cond: BoolCond) -> Int {
        units.filter{cond($0)}.len
    }
    
    func count(satisfyingAll conds: [BoolCond]) -> Int {
        units.indexes(satisfyingAll: conds)?.len ?? 0
    }
    /// some -> maybe all!
    func count(satisfyingSome conds: [BoolCond]) -> Int {
        units.indexes(satisfyingSome: conds)?.len ?? 0
    }
    
    func count(satisfyingNone conds: [BoolCond]) -> Int {
        units.indexes(satisfyingNone: conds)?.len ?? 0
    }
    
    //MARK: divided by cond
    
    ///   Separates an array into 2 arrays based on a predicate.
    ///     [0, 1, 2, 3, 4, 5].divided { $0 % 2 == 0 } -> ( [0, 2, 4], [1, 3, 5] )
    /// - Returns: 2 arrays, the first containing the units for which the specified condition evaluates to true, the second containing the rest.
    func divided(by cond: BoolCond) -> BoolPair<LU> {
        var matching = [LU]()
        var nonMatching = [LU]()
        units.forEach {
            if cond($0) {
                matching.append($0)
            } else {
                nonMatching.append($0)
            }
        }
        return BoolPair(trues: matching, falses: nonMatching)
    }
    
    ///   Separates an array into 2 arrays based on a predicate.
    ///     [0, 1, 2, 3, 4, 5].divided { $0 % 2 == 0 } -> ( [0, 2, 4], [1, 3, 5] )
    /// - Returns: 2 arrays, the first containing the units for which the specified condition evaluates to true, the second containing the rest.
    func divided(by conds: [BoolCond]) -> BoolPair<LU> {
        var matching = [LU]()
        var nonMatching = [LU]()
        units.forEach { unit in
            if conds.allSatisfy({ $0(unit) }) {
                matching.append(unit)
            } else {
                nonMatching.append(unit)
            }
        }
        return BoolPair(trues: matching, falses: nonMatching)
    }
    
    //MARK:
    
    /// peopleArray = peopleArray.filterDuplicate{ ($0.name, $0.age, $0.sex) }
    func filterDuplicates<T>(with keyValue: (LU) -> T ) -> [LU] {
        var uniqueKeys = Set<Str>()
        return units.filter{uniqueKeys.insert("\(keyValue($0))").inserted}
    }
}


