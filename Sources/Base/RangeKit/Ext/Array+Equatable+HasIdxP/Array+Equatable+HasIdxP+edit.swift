

// Equatable + HasIdx
public extension Array where Element: Equatable & HasIdxP {
    
    //MARK: removeDuplicates
    
    /// returns true if any were removed
    @discardableResult
    mutating func removeDuplicates(in rng: Rng) -> Bool {
        if let a = removingDuplicates(in: rng) {
            self = a
            return true
        }
        return false
    }
    
    /// returns new array if any were removed
    /// (if empty array was given it is returned)
    func removingDuplicates(in rng: Rng) -> Array? {
         units(in: rng)?.removingDuplicates
    }
    
    /// shifts indices
    /// returns false if some were not added
    //    @discardableResult
    //    mutating func insertUnique(_ items: Array,
    //                               at index: Int) -> Bool {
    //        L.notImpl()
    //        //        guard !items.isEmpty else {
    //        //            return false
    //        //        }
    //        //        var added = true
    //        //        for item in items {
    //        //            if !contains(item) {
    //        //                self.append(item)
    //        //            } else {
    //        //                added = false
    //        //            }
    //        //        }
    //        //        return added
    //    }
}


//TODO: cond, matchCond
