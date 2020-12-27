

public protocol ScoreCmpT {
    
    //TODO:
    // guarantee that order doesnt matter
    // consider renaming to distance(between)
    
    /// 1.0 - means 100 equal, 0.0 - nothing similar
    /// returns match score meaning how much the two objects are similar
    static func compare(_ lhs: Self,
                        _ rhs: Self) -> Double
}
public extension ScoreCmpT {
    
    /// calculates match score
    func compare(_ other: Self) -> Double {
        Self.compare(self, other)
    }
    
    /// returns true if match score is equal to the given
    func equals(_ other: Self,
                with score: Double = 1.0) -> Bool {
        compare(other) == score
    }
    
    /// returns true if the match score is in range between min and max
    func equalsInRange(_ other: Self,
                       minMScore: Double = 0.0,
                       maxMScore: Double = 1.0) -> Bool {
        crashIf(!isValidMScore(minMScore) || !isValidMScore(maxMScore))
        
        
        let score = compare(other)
        return score >= minMScore && score <= maxMScore
    }
}

func isValidMScore(_ num: Double) -> Bool {
    num >= 0.0 && num <= 1.0
}


public protocol HasScoreCmpTypeT: HasUnitTypeT where Unit: ScoreCmpT {}

