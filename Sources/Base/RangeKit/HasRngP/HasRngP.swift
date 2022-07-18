


public protocol HasRngP: HasIdxSetP { 
    
    var rng: Rng {get}
}

public extension HasRngP {
    
    // HasIdxSetP
    var idxSet: IndexSet {
        rng.idxSet
    }
    
    var from: Int {
        rng.from
    }
    var to: Int {
        rng.to
    }
    /// from == to
    var has1Index: Bool {
        from == to
    }
    
    //MARK: makeRange
    
    func range(withIdxsMoreThan idx: Int,
               includingIt: Bool = false) -> Rng? {
        rng.range(withIdxsMoreThan: idx,
                  includingIt: includingIt)
    }
    
    func range(withIdxsLessThan idx: Int,
               includingIt: Bool = false) -> Rng? {
        rng.range(withIdxsLessThan: idx,
                  includingIt: includingIt)
    }
    
    func range(from idx1: Int,
               to idx2: Int,
               includingBoth: Bool = false) -> Rng? {
        rng.range(from: idx1,
                  to: idx2,
                  includingBoth: includingBoth)
    }
    
    
    //MARK: -
    
    func isInRange(_ rng: Rng,
                   includingEnds: Bool = false) -> Bool {
        rng.isInRange(rng,
                      includingEnds: includingEnds)
    }
    
    func isOutside(_ rng: Rng) -> Bool{
        rng.isOutside(rng)
    }
    
    func contains(_ rng: Rng,
                  includingEnds: Bool = false) -> Bool {
        rng.contains(rng,
                     includingEnds: includingEnds)
    }
}


public protocol RngHashableT: HasRngP, Hashable {}

public extension RngHashableT {
    func hash(into hasher: inout Hasher) {
        if has1 {
            hasher.combine(from)
        } else {
            hasher.combine(from)
            hasher.combine(to)
        }
    }
}



public protocol HasMutRngP: HasRngP, HasMutIndexSetP {
    
    var rng: Rng {get set}
}

public extension HasMutRngP {
    
    // HasMutIndexSetP
    /// interface for handling both indexes and idxSet
    var idxSet: IndexSet {
        get {
            rng.idxSet
        }
        set {
            rng.idxSet = newValue
        }
    }
}
