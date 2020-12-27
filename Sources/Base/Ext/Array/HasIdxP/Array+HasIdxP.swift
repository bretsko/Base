


public extension Array where Element: HasIdxP {
    
    // indices is used by Swift
    var indexes: [Int] {
        map{$0.idx}
    }
    
    /// indices is used by Swift
    var indexesSorted: [Int] {
        map{$0.idx}.sorted()
    }
    var idxSet: Set<Int> {
        Set(indexes)
    }
    
    var sortedByIdx: Array {
        sorted(by: {$0.idx < $1.idx })
    }
    var reversedByIdx: Array {
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
    
    
    //MARK: -
    
    
    func units(after idx: Int) -> Array? {
        crashIfNegative(idx)
        return filterSth{$0.idx > idx}
    }
    func units(before idx: Int) -> Array? {
        crashIfNegative(idx)
        return filterSth{$0.idx < idx}
    }
    
    /// first match is returned only
    func unit(with idx: Int) -> E? {
        crashIfNegative(idx)
        return first(where: {$0.idx == idx })
    }
    /// if allOrNothing is true, returns all or nothing
    func units(with indices: [Int],
               allOrNothing: Bool = false) -> Array? {
        crashIfNegative(indices)
        if allOrNothing && !hasUnits(with: indices) {
            return nil
        }
        return filterSth{indices.contains($0.idx)}
    }
    
    
    //MARK: -
    
    
    /// first by idx, in numeric order, for ex.  1 3 2 -> 1 is first
    func firstUnit(after idx: Int) -> E? {
        crashIfNegative(idx)
        return units(after:idx)?.first
    }
    /// first by idx, in numeric order, for ex.  1 3 2 -> 1 is first
    func firstUnit(before idx: Int) -> E? {
        crashIfNegative(idx)
        return units(before:idx)?.first
    }
    
    /// last by idx, in numeric order, for ex.  1 3 2 -> 3 is last
    func lastUnit(after idx: Int) -> E? {
        crashIfNegative(idx)
        return units(after:idx)?.last
    }
    /// last by idx, in numeric order, for ex.  1 3 2 -> 3 is last
    func lastUnit(before idx: Int) -> E? {
        crashIfNegative(idx)
        return units(before:idx)?.last
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
    
    /// some -> maybe all!
    /// false if none
    func hasSomeUnits(with indices: [Int]) -> Bool {
        crashIfNegative(indices)
        return has{indices.contains($0.idx)}
    }
    /// false if any is present
    func hasNoUnits(with indices: [Int]) -> Bool {
        return !hasSomeUnits(with:indices)
    }
    
    
    //MARK: conds
    
    // Array+BoolCond
    
    /// if any of the conds filters out all units - nil is returned without continuing (obvious)
    func indexes(where cond: BoolCond) -> [Int]? {
        filter(cond).indexes.sth
    }
    
    func indexes(satisfyingAll conds: [BoolCond]) -> [Int]? {
        map { a in
            conds.allSatisfy{ $0(a) } ? a.idx : nil
        }.compactMap{$0}.sth
    }
    
    /// some -> maybe all!
    func indexes(satisfyingSome conds: [BoolCond]) -> [Int]? {
        map { a in
            conds.has{ $0(a) } ? a.idx : nil
        }.compactMap{$0}.sth
    }
    
    func indexes(satisfyingNone conds: [BoolCond]) -> [Int]? {
        map { a in
            conds.allSatisfy{ $0(a) == false } ? a.idx : nil
        }.compactMap{$0}.sth
    }
    
    //MARK: filter indexes
    
    //TODO:
    /// if any of the conds filters out all units - nil is returned without continuing (obvious)
    //    func indexes(satisfyingAll conds: BoolCond...) -> [Int]? {
    //        filtering(with: conds)?.indexes
    //    }
    //TODO: satisfyingSome, satisfyingNone
    
    
    //MARK: allowGaps
    
    //TODO: consider adding allowance - for approx checking, for ex. if allowance is 3, means from +- 3 and to +- 3
    /// if allowGaps is true - allows some missing indices
    //    func hasUnits(in rng: Rng,
    //                  allowGaps: Bool = false) -> Bool {
    //        hasUnits(with: range.indexes)
    //    }
    //    /// if allowGaps is true - allows some missing indices
    //    func hasUnits(from index1: Int,
    //                  to index2: Int,
    //                  allowGaps: Bool = false) -> Bool {
    //        units(from: index1, to: index2, allowGaps: allowGaps) != nil
    //    }
    //
    //    /// if allowGaps is true - allows some missing indices, otehrwise returns nil if any is missing
    //    func units(in rng: Rng,
    //               allowGaps: Bool = false) -> Array? {
    //        if allowGaps {
    //            filterSth{range.hasInside($0.idx)}
    //        } else {
    //            filterSth{range.contains($0.idx)}
    //        }
    //    }
    //
    //    /// if allowGaps is true - allows some missing indices, otehrwise returns nil if any is missing
    //    func units(from index1: Int,
    //               to index2: Int,
    //               allowGaps: Bool = false) -> Array? {
    //
    //        let range = Rng(index1, index2)
    //        return units(in: range, allowGaps: allowGaps)
    //    }
    
    
    //TODO: consider adding allowance - for approx checking, for ex. if allowance is 3, means idx +- 3
    /// returns all or nil
    //    func units(with indices: [Int]) -> Array? {
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
    //    func getUnits(after idx: Int) -> Array? {
    //
    //        crashIfNegative(idx)
    //        guard hasUnit(at: idx) else {
    //            return nil // or crashIfFalse?
    //        }
    //        return filterSth{$0.idx > idx}
    //    }
    
    
    //    func units(after idx: Int,
    //               includingIt: Bool = false) -> Array? {
    //
    //        if includingIt {
    //            return filterSth({$0.idx >= idx })
    //        } else {
    //            return filterSth({$0.idx > idx })
    //        }
    //    }
    //
    //    func units(before idx: Int,
    //               includingIt: Bool = false) -> Array? {
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
    //                  failOnMissing: Bool = false) -> Array? {
    //        var all = Array()
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
}




