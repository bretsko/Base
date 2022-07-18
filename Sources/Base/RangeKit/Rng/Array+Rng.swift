


public extension Array where Element == Rng {
    
    /// exact match only!
    func allHave(_ idxSet: IndexSet) -> Bool {
        allSatisfy{$0.idxSet == idxSet}
    }
    
    /// exact match only!
    func noneHave(_ idxSet: IndexSet) -> Bool {
        allSatisfy{$0.idxSet != idxSet}
    }
    
    /// some -> maybe all!
    /// exact match only!
    func someHave(_ idxSet: IndexSet) -> Bool {
        has{$0.idxSet == idxSet}
    }
    
    /// some -> maybe all!
    /// exact match only!
    func someDontHave(_ idxSet: IndexSet) -> Bool {
        has{$0.idxSet != idxSet}
    }
    
    //TODO: consider adding param - rng can be bigger, include
    
    /// exact match only!
    func allHaveRange(from: Int, to: Int) -> Bool {
        allSatisfy{$0.from == from && $0.to == to}
    }
    /// such exact match not present
    func noneHaveRange(from: Int, to: Int) -> Bool {
        allSatisfy{$0.from != from && $0.to != to}
    }
    
    /// not exact match, equal or more
    func allIncludeRange(from: Int, to: Int) -> Bool {
        allSatisfy{$0.from <= from && $0.to >= to}
    }
    
    /// intersection is allowed
    //    func noneIncludeRange(from: Int, to: Int) -> Bool {
    //        // allSatisfy{$0.from > from && $0.to < to}
    //         has{$0.rng.contains})
    //    }
    
    /// if includingEnds is false, excludes ends
    func allAreInRange(from: Int, to: Int,
                       includingEnds: Bool = true) -> Bool {
        
        allSatisfy {
            $0.rng.isInRange(Rng(from, to),
                             includingEnds:includingEnds)
        }
    }
    
    func allAreOutsideRange(from: Int, to: Int) -> Bool {
        allSatisfy{
            $0.rng.isOutsideRange(from:from, to:to)
        }
    }
    
    func allContainRange(from: Int, to: Int,
                         includingEnds: Bool = true) -> Bool {
        
        allSatisfy {
            $0.rng.containsRange(from:from, to:to, includingEnds:includingEnds)
        }
    }
    
    //MARK: index
    
    /// means idx is between from and to
    func allHaveInside(_ idx: Int,
                       includingEnds: Bool = true) -> Bool {
        
        allSatisfy {
            $0.rng.hasInside(idx, includingEnds:includingEnds)
        }
    }
    
    /// means idx is bigger than to or less than from
    func allHaveOutside(_ idx: Int) -> Bool {
        allSatisfy{ $0.rng.hasOutside(idx) }
    }
    
    /// means all given idxs are outside
    func allHaveOutside(_ idxs: [Int]) -> Bool {
        allSatisfy{ $0.rng.hasOutside(idxs) }
    }
    
    /// = hasSomeInside
    func allContain(some idxs: [Int]) -> Bool {
        allSatisfy{ $0.rng.contains(some:idxs) }
    }
    /// means all given idxs are inside
    func hasSomeInside(_ idxs: [Int]) -> Bool {
        allSatisfy{ $0.rng.hasSomeInside(idxs) }
    }
    
    /// = hasAllInside
    func allContainAll(_ idxs: [Int]) -> Bool {
        allSatisfy{ $0.rng.containsAll(idxs) }
    }
    /// means all given idxs are inside
    func allHaveAllInside(_ idxs: [Int]) -> Bool {
        allSatisfy{ $0.rng.hasAllInside(idxs) }
    }
    
    /// means given idxs contain all indices
    func allArePartOf(_ idxs: [Int]) -> Bool {
        allSatisfy{ $0.rng.isPartOf(idxs) }
    }
    
    //todo more
}



//TODO: try bridge via array
public extension Set where Element == Rng {
    
    /// exact match only!
    func allHave(_ idxSet: IndexSet) -> Bool {
        allSatisfy{$0.idxSet == idxSet}
    }
    
    /// exact match only!
    func noneHave(_ idxSet: IndexSet) -> Bool {
        allSatisfy{$0.idxSet != idxSet}
    }
    
    /// exact match only!
    func someHave(_ idxSet: IndexSet) -> Bool {
        has{$0.idxSet == idxSet}
    }
    
    /// exact match only!
    func someDontHave(_ idxSet: IndexSet) -> Bool {
        has{$0.idxSet != idxSet}
    }
    
    //TODO: consider adding param - rng can be bigger, include
    
    /// exact match only!
    func allHaveRange(from: Int, to: Int) -> Bool {
        allSatisfy{$0.from == from && $0.to == to}
    }
    /// such exact match not present
    func noneHaveRange(from: Int, to: Int) -> Bool {
        allSatisfy{$0.from != from && $0.to != to}
    }
    
    /// not exact match, equal or more
    func allIncludeRange(from: Int, to: Int) -> Bool {
        allSatisfy{$0.from <= from && $0.to >= to}
    }
    
    /// intersection is allowed
    //    func noneIncludeRange(from: Int, to: Int) -> Bool {
    //        // allSatisfy{$0.from > from && $0.to < to}
    //         has{$0.rng.contains})
    //    }
    
    /// if includingEnds is false, excludes ends
    func allAreInRange(from: Int, to: Int,
                       includingEnds: Bool = true) -> Bool {
        
        allSatisfy {
            $0.rng.isInRange(Rng(from, to),
                             includingEnds:includingEnds) }
    }
    
    func allAreOutsideRange(from: Int, to: Int) -> Bool {
        allSatisfy {
            $0.rng.isOutsideRange(from:from, to:to)
        }
    }
    
    func allContainRange(from: Int, to: Int,
                         includingEnds: Bool = true) -> Bool {
        
        allSatisfy {
            $0.rng.containsRange(from:from, to:to,
                                 includingEnds:includingEnds)
        }
    }
    
    //MARK: index
    
    /// means idx is between from and to
    func allHaveInside(_ idx: Int,
                       includingEnds: Bool = true) -> Bool {
        allSatisfy {
            $0.rng.hasInside(idx,
                             includingEnds:includingEnds)
        }
    }
    
    /// means idx is bigger than to or less than from
    func allHaveOutside(_ idx: Int) -> Bool {
        allSatisfy{ $0.rng.hasOutside(idx) }
    }
    
    /// means all given idxs are outside
    func allHaveOutside(_ idxs: [Int]) -> Bool {
        allSatisfy{ $0.rng.hasOutside(idxs) }
    }
    
    /// = hasSomeInside
    func allContainSome(_ idxs: [Int]) -> Bool {
        allSatisfy{ $0.rng.contains(some:idxs) }
    }
    /// means all given idxs are inside
    func hasSomeInside(_ idxs: [Int]) -> Bool {
        allSatisfy{ $0.rng.hasSomeInside(idxs) }
    }
    
    /// = hasAllInside
    func allContainAll(_ idxs: [Int]) -> Bool {
        allSatisfy{ $0.rng.containsAll(idxs) }
    }
    /// means all given idxs are inside
    func allHaveAllInside(_ idxs: [Int]) -> Bool {
        allSatisfy{ $0.rng.hasAllInside(idxs) }
    }
    
    /// means given idxs contain all indices
    func allArePartOf(_ idxs: [Int]) -> Bool {
        allSatisfy{ $0.rng.isPartOf(idxs) }
    }
    
    //todo more
}
