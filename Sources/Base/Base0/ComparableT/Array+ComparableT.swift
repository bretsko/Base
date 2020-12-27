

public extension Array where Element: ComparableT {
    
    func compare(with other: E) -> [Double] {
        map{$0.compare(with: other)}
    }
}

public extension Array where Element: ComparableT & SortableP {
    
    func minDiffScore(with other: E) -> Double? {
        compare(with: other).min()
    }
    func maxDiffScore(with other: E) -> Double? {
        compare(with: other).max()
    }
    func avgDiffScore(with other: E) -> Double? {
        compare(with: other).average
    }
    
    func minDiffScore(with others: Array) -> Double? {
        L.notImpl()
    }
    func maxDiffScore(with others: Array) -> Double? {
        L.notImpl()
    }
    func avgDiffScore(with others: Array) -> Double? {
        L.notImpl()
    }
    
    /// compares each unit
    func allDiffScores(with other: E,
                       areAbove score: Double) -> Bool {
        compare(with: other).allSatisfy{$0 > score}
    }
    func allDiffScores(with other: E,
                       areBelow score: Double) -> Bool {
        compare(with: other).allSatisfy{$0 < score}
    }
    
    func areEquivalent(with other: E) -> Bool {
        compare(with: other).allSatisfy{$0 == 1.0}
    }
    func areCompletelyDifferent(from other: E) -> Bool {
        compare(with: other).allSatisfy{$0 == 0.0}
    }
    
    
    func withMinDiffScore(with other: E) -> Array? {
        guard let s = minDiffScore(with: other) else {
            return nil
        }
        return filter {$0.compare(with: other) == s}.sth
    }
    func withMaxDiffScore(with other: E) -> Array? {
        guard let s = maxDiffScore(with: other) else {
            return nil
        }
        return filter {$0.compare(with: other) == s}.sth
    }
    
    // or rename to avgStates
    func withAvgDiffScore(with other: E) -> Array? {
        guard let s = avgDiffScore(with: other) else {
            return nil
        }
        return filter {$0.compare(with: other) == s}.sth
    }
    
    
    
    //    func withMinDiffScore(with others: Array) -> Array? {
    //        guard let s = minDiffScore(with: others) else {
    //            return nil
    //        }
    //        return  filter {$0.compare(with: others) == s}
    //    }
    //    func withMaxDiffScore(with others: Array) -> Array? {
    //        guard let s = maxDiffScore(with: others) else {
    //            return nil
    //        }
    //        return  filter {$0.compare(with: others) == s}
    //    }
    //
    //    // or rename to avgStates
    //    func withAvgDiffScore(with others: Array) -> Array? {
    //        guard let s = avgDiffScore(with: others) else {
    //            return nil
    //        }
    //        return  filter {$0.compare(with: others) == s}
    //    }
}

public extension Set where Element: ComparableT {
    
    func compare(with other: E) -> [Double] {
        map{$0.compare(with: other)}
    }
}

public extension Set where Element: ComparableT & SortableP {
    
    func minDiffScore(with other: E) -> Double? {
        array.minDiffScore(with: other)
    }
    func maxDiffScore(with other: E) -> Double? {
        array.maxDiffScore(with: other)
    }
    func avgDiffScore(with other: E) -> Double? {
        array.avgDiffScore(with: other)
    }
    
    func minDiffScore(with others: Set) -> Double? {
        array.minDiffScore(with: others.array)
    }
    func maxDiffScore(with others: Set) -> Double? {
        array.maxDiffScore(with: others.array)
    }
    func avgDiffScore(with others: Set) -> Double? {
        array.avgDiffScore(with: others.array)
    }
    
    /// compares each unit
    func allDiffScores(with other: E,
                       areAbove score: Double) -> Bool {
        array.allDiffScores(with: other, areAbove: score)
    }
    func allDiffScores(with other: E,
                       areBelow score: Double) -> Bool {
        array.allDiffScores(with: other, areBelow: score)
    }
    
    func areEquivalent(with other: E) -> Bool {
        array.areEquivalent(with: other)
    }
    func areCompletelyDifferent(from other: E) -> Bool {
        array.areCompletelyDifferent(from: other)
    }
    
    
    func withMinDiffScore(with other: E) -> Set? {
        array.withMinDiffScore(with: other)?.set
    }
    func withMaxDiffScore(with other: E) -> Set? {
        array.withMaxDiffScore(with: other)?.set
    }
    func withAvgDiffScore(with other: E) -> Set? {
        array.withAvgDiffScore(with: other)?.set
    }
}
