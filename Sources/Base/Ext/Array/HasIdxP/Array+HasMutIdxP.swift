

public extension Array where Element: HasMutIdxP {
    
    //MARK: add, delete
    
    /// replaces existing units
    /// if failOnIdxCollision is true will not set anything if any idx collision is detected
    /// returns true if the operation was successful
    @discardableResult
    mutating func set(_ units: [E],
                      failOnIdxCollision: Bool = true) -> Bool {
        
        guard !failOnIdxCollision || Set(indexes).len == units.len  else {
            return false
        }
        self = filter{!indexes.contains($0.idx)}
        return true
    }
    
    /// fails on idx collision (only possible if shiftIndices == false)
    /// returns true if added
    @discardableResult
    mutating func add(_ units: [E],
                      shiftIndices: Bool = true) -> Bool {
        fatalError()
        //        guard !hasUnits(with: units.indexes) else {
        //            return false
        //        }
        //        if shiftIndices, let i = lastIdx {
        //            let newUnits = self.shiftIndices(starting: i + 1)
        //            self.append(contentsOf: newUnits)
        //        } else {
        //            self.append(contentsOf: units)
        //        }
        //        return true
    }
    
    /// fails if unit's idx is inconsistent (only possible if shiftIdx == false)
    /// returns true if added
    @discardableResult
    mutating func add(_ unit: E,
                      shiftIdx: Bool = true) -> Bool {
        fatalError()
        //        guard !hasUnit(with: unit.idx) else {
        //            return false
        //        }
        //        if shiftIdx,
        //            let i = lastIdx {
        //            //TODO: proper check
        //            var u = unit
        //            u.idx = i + 1
        //            self.append(u)
        //        } else {
        //            self.append(unit)
        //        }
        //        return true
    }
    
    //TODO: intersecting, adding/union, symmetric diff
    //    func inserting(_ units: [E], in rng: Rng) -> [E]? {
    //        fatalError()
    //    }
    
    //MARK: delete
    
    @discardableResult
    mutating func removeUnit(with idx: Int,
                             shiftIndices: Bool = true) -> Bool {
        
        guard let i = firstIndex(where: {$0.idx == idx}) else {
            return false
        }
        remove(at: i)
        
        guard shiftIndices else {
            return true
        }
        
        fatalError()
        //    units = units.filter(
        //    {unit.idx != sindex })
        
        //        guard let lastUnitIdx = unitsSorted.last?.idx,
        //            idx != lastUnitIdx else {
        //                return true
        //        }
        //
        //        var allUnits = units.filter{$0.idx < idx}
        //        let shiftedUnits = units.filter{$0.idx > idx}
        //        for shiftedUnit in shiftedUnits {
        //            var u = shiftedUnit
        //            precondition(u.idx > 0)
        //            u.idx -= 1
        //            allUnits.append(u)
        //        }
        //        self.units = allUnits
        //        return true
    }
    
    @discardableResult
    mutating func remove(_ unit: E,
                         shiftIndices: Bool = true) -> Bool {
        
        guard let i = firstIndex(where: {$0.idx == unit.idx}) else {
            return false
        }
        remove(at: i)
        
        let removedIdx = unit.idx
        guard let lastUnitIdx = self.lastIdx,
              removedIdx != lastUnitIdx else {
            return true
        }
        
        var allUnits = filter{$0.idx < removedIdx}
        let shiftedUnits = filter{$0.idx > removedIdx}
        
        for shiftedUnit in shiftedUnits {
            var u = shiftedUnit
            precondition(u.idx > 0)
            u.idx -= 1
            allUnits.append(u)
        }
        self = allUnits
        return true
    }
    
    @discardableResult
    mutating func remove(_ units: [E],
                         shiftIndices: Bool = true) -> Bool {
        
        fatalError()
        //        guard units.hasSth else {
        //            return false
        //        }
        //        var removed = true
        //        for unit in units {
        //            if remove(unit: unit) == false {
        //                removed = false
        //            }
        //        }
        //        return removed
    }
    
    //MARK: replace
    
    /// will try! to replace all, does not interrupt
    /// if any failed to be replaced returns false
    /// units are replaced in the same order they are provided
    @discardableResult
    mutating func replace(_ units1: [E],
                          with units2: [E]) -> Bool {
        
        guard units1.hasSth, units2.hasSth else {
            return false
        }
        guard units1.len == units2.len else {
            fatalError("array sizes mismatch")
        }
        fatalError()
        //        var replaced  = true
        //        for (unit1,unit2) in zip(units1,units2) {
        //            if replace(unit:unit1, with: unit2) == false {
        //                replaced = false
        //            }
        //        }
        //        return replaced
    }
    
    /// the new unit gets automatically idx of the replaced unit
    /// if shiftIndices is true and the removed unit is has not the highest idx, all left units with higher indices are decreased by one
    /// returns true if replaced
    @discardableResult
    mutating func replace(_ unit1: E,
                          with unit2: E) -> Bool {
        
        guard let i = firstIndex(where: {$0.idx == unit1.idx}) else {
            return false
        }
        var newUnit = unit2
        newUnit.idx = self[i].idx
        remove(at: i)
        append(newUnit)
        return true
    }
    
    //TODO: add direction, limits?
    func shiftIndices(starting idx: Int) -> [E] {
        
        var newUnits = [E]()
        var i = idx + 1
        for unit in self.sortedByIdx {
            var u = unit
            u.idx = i
            newUnits.append(u)
            i += 1
        }
        return newUnits
    }
}





//TODO: try bridge via array
public extension Set where Element: HasMutIdxP {
    
    //MARK: add, delete
    
    /// replaces existing units
    /// if failOnIdxCollision is true will not set anything if any idx collision is detected
    /// returns true if the operation was successful
    @discardableResult
    mutating func set(_ units: [E],
                      failOnIdxCollision: Bool = true) -> Bool {
        
        guard !failOnIdxCollision || units.len == len else {
            return false
        }
        self = filter{!indexes.contains($0.idx)}
        return true
    }
    
    /// fails on idx collision (only possible if shiftIndices == false)
    /// returns true if added
    @discardableResult
    mutating func add(_ units: [E],
                      shiftIndices: Bool = true) -> Bool {
        fatalError()
        //        guard !hasUnits(with: units.indexes) else {
        //            return false
        //        }
        //        if shiftIndices, let i = lastIdx {
        //            let newUnits = self.shiftIndices(starting: i + 1)
        //            self.append(contentsOf: newUnits)
        //        } else {
        //            self.append(contentsOf: units)
        //        }
        //        return true
    }
    
    /// fails if unit's idx is inconsistent (only possible if shiftIdx == false)
    /// returns true if added
    @discardableResult
    mutating func add(_ unit: E,
                      shiftIdx: Bool = true) -> Bool {
        fatalError()
        //        guard !hasUnit(with: unit.idx) else {
        //            return false
        //        }
        //        if shiftIdx,
        //            let i = lastIdx {
        //            //TODO: proper check
        //            var u = unit
        //            u.idx = i + 1
        //            self.append(u)
        //        } else {
        //            self.append(unit)
        //        }
        //        return true
    }
    
    //TODO: intersecting, adding/union, symmetric diff
    //    func inserting(_ units: [E], in rng: Rng) -> [E]? {
    //        fatalError()
    //    }
    
    //MARK: delete
    
    @discardableResult
    mutating func removeUnit(with idx: Int,
                             shiftIndices: Bool = true) -> Bool {
        
        guard let i = firstIndex(where: {$0.idx == idx}) else {
            return false
        }
        remove(at: i)
        
        guard shiftIndices else {
            return true
        }
        
        fatalError()
        //    units = units.filter(
        //    {unit.idx != sindex })
        
        //        guard let lastUnitIdx = unitsSorted.last?.idx,
        //            idx != lastUnitIdx else {
        //                return true
        //        }
        //
        //        var allUnits = units.filter{$0.idx < idx}
        //        let shiftedUnits = units.filter{$0.idx > idx}
        //        for shiftedUnit in shiftedUnits {
        //            var u = shiftedUnit
        //            precondition(u.idx > 0)
        //            u.idx -= 1
        //            allUnits.append(u)
        //        }
        //        self.units = allUnits
        //        return true
    }
    
    @discardableResult
    mutating func remove(_ unit: E,
                         shiftIndices: Bool = true) -> Bool {
        
        guard let i = firstIndex(where: {$0.idx == unit.idx}) else {
            return false
        }
        remove(at: i)
        
        let removedIdx = unit.idx
        guard let lastUnitIdx = self.lastIdx,
              removedIdx != lastUnitIdx else {
            return true
        }
        
        var allUnits = filter{$0.idx < removedIdx}
        let shiftedUnits = filter{$0.idx > removedIdx}
        for shiftedUnit in shiftedUnits {
            var u = shiftedUnit
            precondition(u.idx > 0)
            u.idx -= 1
            allUnits.insert(u)
        }
        self = allUnits
        return true
    }
    
    @discardableResult
    mutating func remove(_ units: [E],
                         shiftIndices: Bool = true) -> Bool {
        
        fatalError()
        //        guard units.hasSth else {
        //            return false
        //        }
        //        var removed = true
        //        for unit in units {
        //            if remove(unit: unit) == false {
        //                removed = false
        //            }
        //        }
        //        return removed
    }
    
    //MARK: replace
    
    /// will try! to replace all, does not interrupt
    /// if any failed to be replaced returns false
    /// units are replaced in the same order they are provided
    @discardableResult
    mutating func replace(_ units1: [E],
                          with units2: [E]) -> Bool {
        
        guard units1.hasSth, units2.hasSth else {
            return false
        }
        guard units1.len == units2.len else {
            fatalError("array sizes mismatch")
        }
        fatalError()
        //        var replaced  = true
        //        for (unit1,unit2) in zip(units1,units2) {
        //            if replace(unit:unit1, with: unit2) == false {
        //                replaced = false
        //            }
        //        }
        //        return replaced
    }
    
    /// the new unit gets automatically idx of the replaced unit
    /// if shiftIndices is true and the removed unit is has not the highest idx, all left units with higher indices are decreased by one
    /// returns true if replaced
    @discardableResult
    mutating func replace(_ unit1: E,
                          with unit2: E) -> Bool {
        
        guard let i = firstIndex(where: {$0.idx == unit1.idx}) else {
            return false
        }
        var newUnit = unit2
        newUnit.idx = self[i].idx
        remove(at: i)
        insert(newUnit)
        return true
    }
    
    //TODO: add direction, limits?
    func shiftIndices(starting idx: Int) -> [E] {
        
        var newUnits = [E]()
        var i = idx + 1
        for unit in self.sortedByIdx {
            var u = unit
            u.idx = i
            newUnits.append(u)
            i += 1
        }
        return newUnits
    }
}

