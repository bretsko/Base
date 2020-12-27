


public extension Array where Element: ScoreCmpT {
    
    /// can use for ex. to find most common cases where objects have same specific property value
    // func getMostCommon(where cond: )
    // try to use func probability(of:)
    
    //sort, find most similar value by some property, etc
    
    /// returns arrays of objs which satisfy matchBlock cond
    func units(with matchBlock: (E, E) -> Bool) -> [[E]]? {
        
        var idxSets = [Set<Int>]()
        
        /// tries to add pair to an existing Set, or creates new
        func add(_ i1: Int, _ i2: Int) {
            for (i,idxSet) in idxSets.enumerated() {
                
                guard idxSet.contains(where: {
                    matchBlock(self[i1], self[$0])
                }) else {
                    continue
                }
                idxSets[i].insert(i1, i2)
                idxSets[i] = idxSet
                return
            }
            idxSets.append(Set([i1, i2]))
        }
        
        indices.forEach { i1 in
            indices.forEach { i2 in
                if matchBlock(self[i1], self[i2]) {
                    add(i1,i2)
                }
            }
        }
        
        return idxSets.map {
            units(at: $0.array, crashIfNotFound: true)
        }.compactMap{$0}.sth
    }
    
    /// returns arrays of objs with given match score
    func unitsWithMatchScore(_ matchScore: Double) -> [[E]]? {
        units(with: { unit1, unit2 in
            unit1.compare(unit2) == matchScore
        })
    }
    
    
    /// returns arrays of objs with match score more than the given
    func unitsWithMatchScore(moreThan matchScore: Double) -> [[E]]? {
        units(with: { unit1, unit2 in
            unit1.compare(unit2) > matchScore
        })
    }
    
    /// returns arrays of objs with match score less than the given
    func unitsWithMatchScore(lessThan matchScore: Double) -> [[E]]? {
        units(with: { unit1, unit2 in
            unit1.compare(unit2) < matchScore
        })
    }
    
    /// returns arrays of objs with match score less than the given
    func unitsWithMatchScore(moreThan matchScore1: Double,
                             andLessThan matchScore2: Double) -> [[E]]? {
        
        units(with: { unit1, unit2 in
            unit1.compare(unit2) > matchScore1 && unit1.compare(unit2) < matchScore2
        })
    }
    
    //MARK: -
    
    /// arrays of objs with match score 1.0
    var equalUnits: [[E]]? {
        unitsWithMatchScore(1.0)
    }
    
    /// arrays of objs with match score 0.0
    var differentUnits: [[E]]? {
        unitsWithMatchScore(0.0)
    }
    
    //MARK: -
    
    /// uses ScoreCmpT
    /// returns nil if no pair was found with match score above 0
    /// if several pairs have the same highest score - all are returned
    var mostSimilarUnits: [E]? {
        var idxSet = Set<Int>()
        var topScore = 0.0
        indices.forEach { i1 in
            indices.forEach { i2 in
                let score = self[i1].compare(self[i2])
                if score > topScore {
                    topScore = score
                    idxSet = [i1,i2].set
                } else if score == topScore {
                    idxSet.insert(i1, i2)
                }
            }
        }
        return units(at: idxSet.array, crashIfNotFound: true)
    }
    
    
    
    /// uses ScoreCmpT
    /// returns nil if no pair was found with match score above 0
    /// if several pairs have the same highest score - all are returned
    var leastSimilarUnits: [E]? {
        var idxSet = Set<Int>()
        var minMScore = 1.0
        indices.forEach { i1 in
            indices.forEach { i2 in
                let score = self[i1].compare(self[i2])
                if score < minMScore {
                    minMScore = score
                    idxSet = [i1,i2].set
                } else if score == minMScore {
                    idxSet.insert(i1, i2)
                }
            }
        }
        return units(at: idxSet.array, crashIfNotFound: true)
    }
    
    /// uses ScoreCmpT
    /// groups units into sets of units with the same match score
    var similarUnits: [[E]]? {
        var score2idxs = [Double: Set<Int>]()
        indices.forEach { i1 in
            indices.forEach { i2 in
                let score = self[i1].compare(self[i2])
                if var idxSet = score2idxs[score] {
                    idxSet.insert(i1,i2)
                    score2idxs[score] = idxSet
                } else {
                    score2idxs[score] = [i1,i2].set
                }
            }
        }
        return score2idxs.values.map {
            units(at: $0.array, crashIfNotFound: true)
        }.compactMap{$0}.sth
    }
}


public extension Set where Element: ScoreCmpT {
    
    /// arrays of objs with given match score
    func units(with filterBlock: (E, E) -> Bool) -> [[E]]? {
        array.units(with: filterBlock)
    }
    
    /// arrays of objs with given match score
    func unitsWithMatchScore(_ matchScore: Double) -> [[E]]? {
        array.unitsWithMatchScore(matchScore)
    }
    
    
    /// arrays of objs with match score more than the given
    func unitsWithMatchScore(moreThan matchScore: Double) -> [[E]]? {
        array.unitsWithMatchScore(moreThan: matchScore)
    }
    
    /// arrays of objs with match score less than the given
    func unitsWithMatchScore(lessThan matchScore: Double) -> [[E]]? {
        array.unitsWithMatchScore(lessThan: matchScore)
    }
    
    //MARK: -
    
    /// arrays of objs with match score 1.0
    var equalUnits: [[E]]? {
        array.equalUnits
    }
    
    /// arrays of objs with match score 0.0
    var differentUnits: [[E]]? {
        array.differentUnits
    }
    
    /// uses ScoreCmpT
    /// returns nil if no pair was found with match score above 0
    /// if several pairs have the same highest score - all are returned
    var mostSimilarUnits: [E]? {
        array.mostSimilarUnits
    }
    
    /// uses ScoreCmpT
    /// returns nil if no pair was found with match score above 0
    /// if several pairs have the same highest score - all are returned
    var leastSimilarUnits: [E]? {
        array.leastSimilarUnits
    }
    
    /// uses ScoreCmpT
    /// groups units into sets of similar units
    /// unpaired units are not returned
    /// returns nil if no pair was found with match score above 0
    var similarUnits: [[E]]? {
        array.similarUnits
    }
}
