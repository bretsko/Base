

//TODO: try bridge via array, consider impl also ext for HasIdxT
//Set+Hashable
public extension Set where Element: HasIdxP {
    
    // indices is used by Swift
    var indexes: [Int] {
        map{$0.idx}
    }
    
    // indices is used by Swift
    var indexesSorted: [Int] {
        map{$0.idx}.sorted()
    }
    
    var sortedByIdx: [E] {
        sorted(by: {$0.idx < $1.idx })
    }
    var reversedByIdx: [E] {
        sorted(by: {$0.idx > $1.idx })
    }
    
    // should be 0 always?
    /// by numeric order
    var firstIdx: Int? {
        indexesSorted.first
    }
    /// by numeric order
    var lastIdx: Int? {
        indexesSorted.last
    }
    
    
    /// checks if given index is the biggest in this array
    func isLastIdx(_ idx: Int) -> Bool {
        crashIfNegative(idx)
        return lastIdx == idx
    }
    /// checks if given index is the smallest in this array
    func isFirstIdx(_ idx: Int) -> Bool {
        crashIfNegative(idx)
        return firstIdx == idx
    }
    
    
    /// by idx
    var firstUnit: E? {
        sortedByIdx.first
    }
    /// by idx
    var lastUnit: E? {
        sortedByIdx.last
    }
    
    
    
    //MARK: addUnique
    
    /// returns true if any were added
    @discardableResult
    mutating func addUnique(_ units: Set) -> Bool {
        if units.isEmpty {
            return false
        }
        let a = len
        formUnion(units)
        return a == len
    }
    
    /// returns nil if none were added
    func addingUnique(_ units: Set) -> Set? {
        var a = self
        if a.addUnique(units) {
            return a
        } else {
            return nil
        }
    }
    
    
    //MARK: removing
    
    /// a new set has units that are not present in the other
    /// returns true if any were found common
    @discardableResult
    mutating func remove(_ units: Set) -> Bool {
        if units.isEmpty {
            return false
        }
        let a = len
        subtract(units)
        return a == len
    }
    
    /// a new set has units that are common to both arrays
    /// returns nil if failed
    func removing(_ units: Set) -> Set? {
        var a = self
        if a.remove(units) {
            return a
        }
        return nil
    }
    
    
    func units(after idx: Int) -> Set? {
        crashIfNegative(idx)
        return filter{$0.idx > idx}.sth
    }
    func units(before idx: Int) -> Set? {
        crashIfNegative(idx)
        return filter{$0.idx < idx}.sth
    }
    
    /// first match is returned only
    func unit(with idx: Int) -> E? {
        crashIfNegative(idx)
        return first(where: {$0.idx == idx })
    }
    /// if allOrNothing is true, returns all or nothing
    func units(with indices: [Int],
               allOrNothing: Bool = false) -> Set? {
        crashIfNegative(indices)
        if allOrNothing && !hasUnits(with: indices) {
            return nil
        }
        return filter{indices.contains($0.idx)}.sth
    }
    
    
    /// first by idx, in numeric order, for ex.  1 3 2 -> 1 is first
    func firstUnit(after idx: Int) -> E? {
        crashIfNegative(idx)
        return units(after:idx)?.sortedByIdx.first
    }
    /// first by idx, in numeric order, for ex.  1 3 2 -> 1 is first
    func firstUnit(before idx: Int) -> E? {
        crashIfNegative(idx)
        return units(before:idx)?.sortedByIdx.first
    }
    
    /// last by idx, in numeric order, for ex.  1 3 2 -> 3 is last
    func lastUnit(after idx: Int) -> E? {
        crashIfNegative(idx)
        return units(after:idx)?.sortedByIdx.last
    }
    /// last by idx, in numeric order, for ex.  1 3 2 -> 3 is last
    func lastUnit(before idx: Int) -> E? {
        crashIfNegative(idx)
        return units(before:idx)?.sortedByIdx.last
    }
    
    //MARK: -
    
    /// returns Int which is bigger by one than the largest idx, or nil if the array is empty
    func nextIdx() -> Int? {
        guard let i = lastIdx else {
            return nil
        }
        return i + 1
    }
    /// returns Int which is less by one than the smallest idx, or nil if the array is empty
    /// if already 0 - returns also nil
    func prevIdx() -> Int? {
        guard let i = firstIdx, i != 0 else {
            return nil
        }
        return i - 1
    }
    
    //TODO: prev, inside indices - because range may have gaps
    
    /// can also handle the reversed order of indices
    var indexLength: Int {
        guard let i1 = firstIdx, let i2 = lastIdx else {
            return 0
        }
        if i2 > i1 {
            return i2 - i1
        }
        return i1 - i2
    }
    
    
    //MARK: -
    
    func allHaveIdxs(moreThan idx: Int) -> Bool {
        crashIfNegative(idx)
        return allSatisfy{$0.idx > idx}
    }
    func allHaveIdxs(smallerThan idx: Int) -> Bool {
        crashIfNegative(idx)
        return allSatisfy{$0.idx < idx}
    }
    
    func noneHaveIdxs(moreThan idx: Int) -> Bool {
        crashIfNegative(idx)
        return allSatisfy{$0.idx <= idx}
    }
    func noneHaveIdxs(smallerThan idx: Int) -> Bool {
        crashIfNegative(idx)
        return allSatisfy{$0.idx >= idx}
    }
    
    
    //MARK: -
    
    func hasUnit(with idx: Int) -> Bool {
        crashIfNegative(idx)
        return indexes.contains(idx)
    }
    /// false if any is missing
    func hasUnits(with indices: [Int]) -> Bool {
        crashIfNegative(indices)
        return allSatisfy{indices.contains($0.idx)}
    }
    
    /// false if none
    func hasSomeUnits(with indices: [Int]) -> Bool {
        crashIfNegative(indices)
        return has{indices.contains($0.idx)}
    }
    /// false if any is present
    func hasNoUnits(with indices: [Int]) -> Bool {
        !hasSomeUnits(with:indices)
    }
    
    
    /// if none were removed returns nil (empty array is returned)
    func removing(at indexes: [Int]) -> Set? {
        if indexes.isEmpty {
            return nil
        }
        fatalError()
        // return removing(while: {indexes.contains($0.idx)})
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
    
    
    //MARK: split
    
    /// creates many arrays based on cond
    /// let line = "BLANCHE:   I don't want realism. I want magic!"
    /// print(line.split(while: { $0 == " " }))
    /// Prints "["BLANCHE:", "I", "don\'t", "want", "realism.", "I", "want", "magic!"]"
    /// Param maxSplits
    /// print(line.split(while: { $0 == " " }), maxSplits: 1)
    /// Prints "["BLANCHE:", "  I don\'t want realism. I want magic!"]"
    func splitting(with cond: BoolCond,
                   maxSplits: Int = Int.max) -> [[E]]? {
        // or return Set ?
        return array.splitting(with: cond,
                               maxSplits: maxSplits)
    }
    
    
    //MARK: allowGaps
    
    //TODO: consider adding allowance - for approx checking, for ex. if allowance is 3, means from +- 3 and to +- 3
    /// if allowGaps is true - allows some missing indices
    //    func hasUnits(in rng: Rng,
    //                  allowGaps: Bool = false) -> Bool {
    //        return hasUnits(with: range.indexes)
    //    }
    //    /// if allowGaps is true - allows some missing indices
    //    func hasUnits(from index1: Int,
    //                  to index2: Int,
    //                  allowGaps: Bool = false) -> Bool {
    //        return units(from: index1, to: index2, allowGaps: allowGaps) != nil
    //    }
    //
    //    /// if allowGaps is true - allows some missing indices, otehrwise returns nil if any is missing
    //    func units(in rng: Rng,
    //               allowGaps: Bool = false) -> Set? {
    //        if allowGaps {
    //            return filterSth{range.hasInside($0.idx)}
    //        } else {
    //            return filterSth{range.contains($0.idx)}
    //        }
    //    }
    //
    //    /// if allowGaps is true - allows some missing indices, otehrwise returns nil if any is missing
    //    func units(from index1: Int,
    //               to index2: Int,
    //               allowGaps: Bool = false) -> Set? {
    //
    //        let range = Rng(index1, index2)
    //        return units(in: range, allowGaps: allowGaps)
    //    }
    
    
    //TODO: consider adding allowance - for approx checking, for ex. if allowance is 3, means idx +- 3
    /// returns all or nil
    //    func units(with indices: [Int]) -> Set? {
    //        crashIfNegative(indices)
    //        // all or nil
    //        guard hasUnits(at: indices) else {
    //            return nil // or crashIfFalse?
    //        }
    //        return filterSth{indices.contains($0.idx)}
    //    }
    
    //TODO: consider adding allowance - for approx checking, for ex. if allowance is 3, means idx +- 3
    //    func unit(with idx: Int) -> E? {
    //
    //        return first(where: {$0.idx == idx})
    //    }
    
    
    
    //TODO: consider adding allowance - for approx checking, for ex. if allowance is 3, means idx +- 3
    //    func getUnits(after idx: Int) -> Set? {
    //
    //        crashIfNegative(idx)
    //        guard hasUnit(at: idx) else {
    //            return nil // or crashIfFalse?
    //        }
    //        return filterSth{$0.idx > idx}
    //    }
    
    
    //    func units(after idx: Int,
    //               includingIt: Bool = false) -> Set? {
    //
    //        if includingIt {
    //            return filterSth({$0.idx >= idx })
    //        } else {
    //            return filterSth({$0.idx > idx })
    //        }
    //    }
    //
    //    func units(before idx: Int,
    //               includingIt: Bool = false) -> Set? {
    //
    //        if includingIt {
    //            return filterSth{$0.idx <= idx }
    //        } else {
    //            return filterSth{$0.idx < idx }
    //        }
    //    }
    
    
    
    //!! can be replaced by filter{indices.contains{$0}}
    // if failOnMissing is true it will return nil if at least on is missing
    // if it's false then all misses are ignored and nil is returned if none were found
    //    func units(with indices: [Int],
    //                  failOnMissing: Bool = false) -> Set? {
    //        var all = Set()
    //
    //        for i in indices {
    //            if let unit = unit(with:i)  {
    //                all.append(unit)
    //
    //            } else if failOnMissing {
    //                return nil
    //            }
    //        }
    //        return all
    //    }
    
    
    
    //remove ?
    
    //    /// a new set has units that are common to both arrays
    //    /// returns true if any were found common
    //    @discardableResult
    //    mutating func intersection(_ units: Set) -> Bool {
    //        guard units.hasSth else {
    //            return false
    //        }
    //        let oldLen = len
    //        self = Set(self).intersection(Set(units))
    //        return oldLen == len
    //    }
    //
    //    /// a new set has units that are common to both arrays
    //    /// returns nil if failed
    //    func intersecting(_ units: Set) -> Set? {
    //        var a = self
    //        if a.intersection(units) {
    //            return a
    //        } else {
    //            return nil
    //        }
    //    }
    //
    //    //MARK: symmetricDifference
    //
    //    /// eliminates any common units and merges the rest
    //    /// (new set has units that are either in this array or in the given array, but not in both)
    //    /// returns true if any such were found
    //    @discardableResult
    //    mutating func symmetricDiff(_ units: Set) -> Bool {
    //        guard units.hasSth else {
    //            return false
    //        }
    //        let oldLen = len
    //        self = Set(self).symmetricDifference(Set(units))
    //        return oldLen == len
    //    }
    //
    //
    //    /// eliminates any common units and merges the rest
    //    /// (new set has units that are either in this array or in the given array, but not in both)
    //    /// returns nil if failed
    //    func makeSymmetricDiff(_ units: Set) -> Set? {
    //        var a = self
    //        if a.symmetricDiff(units) {
    //            return a
    //        } else {
    //            return nil
    //        }
    //    }
}










