

public extension HasIdxP {
  
    func isInRange(_ rng: Rng) -> Bool {
        rng.contains(rng)
    }
    func isOutsideRange(_ rng: Rng) -> Bool {
        !isInRange(rng)
    }
}

public extension HasIdxsP {
    // HasRng?
    var rng: Rng {
        Rng(from, to)
    }
}

// HasIdxSetP+has+rng
public extension HasIdxSetP {
    
    /// if includingEnds is false, excludes ends
    func isInRange(from: Int, to: Int,
                   includingEnds: Bool = true) -> Bool {
        if includingEnds {
            return self.from >= from && self.to <= to
        } else {
            return self.from > from && self.to < to
        }
    }
    func isInRange(_ rng: Rng,
                   includingEnds: Bool = true) -> Bool {
        isInRange(from: rng.from, to: rng.to, includingEnds:includingEnds)
    }
    
    func isOutsideRange(from: Int, to: Int) -> Bool {
        Set(from...to).isDisjoint(with: idxSet)
    }
    func isOutside(_ rng: Rng) -> Bool {
        isOutsideRange(from: rng.from, to: rng.to)
    }
    
    
    func containsRange(from: Int, to: Int,
                       includingEnds: Bool = true) -> Bool {
        
        if includingEnds {
            return from >= self.from || to <= self.to
            //return !isOutsideRange(from: from, to: to)
            
        } else {
            return from > self.from || to < self.to
            //return !Set((from+1)...(to-1).isDisjoint(with: idxSet)
        }
    }
    func contains(_ rng: Rng,
                  includingEnds: Bool = true) -> Bool {
        containsRange(from: rng.from, to: rng.to, includingEnds:includingEnds)
    }
}


