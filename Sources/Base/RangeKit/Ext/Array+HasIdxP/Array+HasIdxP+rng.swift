


public extension Array where Element: HasIdxP {
    
    //MARK: rng
    
    /// makes rng with first and last idx, if they are not equal !
    var rng: Rng? {
        guard let a = firstIdx,
              let b = lastIdx else {
            return nil
        }
        return b > a ? Rng(a, b) : Rng(b, a)
    }
    
    //MARK: has
    
    func areInRange(_ rng: Rng) -> Bool {
        allSatisfy{$0.isInRange(rng)}
    }
    func areOutsideRange(_ rng: Rng) -> Bool {
        allSatisfy{!$0.isInRange(rng)}
    }
    
    
    /// all are in rng
    func hasUnits(in rng: Rng) -> Bool {
        areInRange(rng)
    }
    /// all are in rng
    func hasUnits(from index1: Int,
                  to index2: Int) -> Bool {
        hasUnits(in:Rng(index1, index2))
    }
    /// some -> maybe all!
    func hasSomeUnits(in rng: Rng) -> Bool {
        has{$0.isInRange(rng)}
    }
    /// some -> maybe all!
    func hasSomeUnits(from index1: Int,
                      to index2: Int) -> Bool {
        hasUnits(in:Rng(index1, index2))
    }
    
    //MARK: units
    
    
    func units(in rng: Rng) -> Array? {
        filter{$0.isInRange(rng)}.sth
    }
    func units(from index1: Int, to index2: Int) -> Array? {
        units(in: Rng(index1, index2))
    }
    func units(at indexes: [Int]) -> Array? {
        filter{indexes.contains($0.idx)}.sth
    }
    func unitsExcept(at indexes: [Int]) -> Array? {
        filter{!indexes.contains($0.idx)}.sth
    }
    func unitsExcept(in rng: Rng) -> Array? {
        filter{!indexes.contains($0.idx)}.sth
    }
    
    //MARK: remove
    
    
    /// if none were removed returns nil (empty array is returned)
    func removing(in rng: Rng) -> Array? {
        L.notImpl()
        //        removing(while: {$0.isInRange(rng)})
    }
    /// if none were removed returns false
    @discardableResult
    mutating func remove(in rng: Rng) -> Bool {
        if let a = removing(in: rng) {
            self = a
            return true
        }
        return false
    }
    
    
    
    /// if none were removed returns nil (empty array is returned)
    func removing(from index1: Int,
                  to index2: Int) -> Array? {
        removing(in: Rng(index1, index2))
    }
    /// if none were removed returns false
    @discardableResult
    mutating func remove(from index1: Int,
                         to index2: Int) -> Bool {
        if let a = removing(from: index1, to: index2) {
            self = a
            return true
        }
        return false
    }
    
    
    
    /// if none were removed returns nil (empty array is returned)
    func removing(at indexes: [Int]) -> Array?  {
        filter{!indexes.contains($0.idx)} //Rng(indexes)
    }
    /// if none were removed returns false
    @discardableResult
    mutating func remove(at indexes: [Int]) -> Bool {
        if let a = removing(at: indexes) {
            self = a
            return true
        }
        return false
    }
    
    
    /// removes all Except at provided indexes
    /// if none were removed returns nil (empty array is returned)
    func removingExcept(in rng: Rng) -> Array? {
        L.notImpl()
        //removing(while: {!$0.isInRange(rng)})
    }
    /// removes all Except at provided indexes
    /// if none were removed returns false
    @discardableResult
    mutating func removeExcept(in rng: Rng) -> Bool {
        if let a = removingExcept(in: rng) {
            self = a
            return true
        }
        return false
    }
}




