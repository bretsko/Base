


public protocol ComparableT { //HasAvgStateT
    
    /// returns score (0-1) by how many percent other is different
    /// 0.5 - means 50/50, more than 0.5 - can consider similar
    func compare(with other: Self) -> Double
}
public extension ComparableT {
    
    /// returns score (0-1) by how many percent other is different
    func compare(with others: [Self]) -> [Double] {
        others.map{compare(with: $0)}
    }
    
    /// sorted by DiffScore
    func sortByDiffScore(_ others: [Self]) -> [Self] {
        others.sorted(by: {
            compare(with: $0) < compare(with: $1)
        })
    }
    
    func findMostSimilar(in others: [Self]) -> Self? {
        sortByDiffScore(others).first // has lowest score
    }
    func findMostDifferent(in others: [Self]) -> Self? {
        sortByDiffScore(others).last
    }
    
    
    func isEqual(to other: Self) -> Bool {
        compare(with: other) == 1.0
    }
    func isCompletelyDifferent(from other: Self) -> Bool {
        compare(with: other) == 0.0
    }
    
    
    //    // try use HasAvgStateT
    //    func isAvgState(in states: [Self]) -> Bool {
    //        guard let a = states.avgState else {
    //            return false
    //        }
    //        return self == a
    //    }
}

public protocol HasComparableTUnitT: HasUnitTypeT where Unit: ComparableT {}
