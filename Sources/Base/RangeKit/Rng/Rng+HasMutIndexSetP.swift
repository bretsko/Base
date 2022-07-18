



public extension Rng {
    
    // HasMutIndexSetP
    /// interface for handling both indexes and idxSet
    var idxSet: IndexSet {
        get {
            switch self {
            case .idxSet(let idxSet):
                return idxSet
            default:
                return .init(from...to)
            }
        }
        set {
            switch self {
            case .idxSet:
                self = .idxSet(newValue)
                
            case .rng:
                guard let min = newValue.min(),
                    let max = newValue.max() else {
                        fatalError()
                }
                self = .rng(from:min, to:max)
            }
        }
    }
    
    //these 2 vars override vars in protocol extension in HasIdxSetP
    
    var from: Int {
        if let f = _range_from {
            return f
        }
        return indexes.min()!
    }
    
    var to: Int {
        if let t = _range_to {
            return t
        }
        return indexes.max()!
    }

    //MARK: -
    
    func isInRange(_ rng: Rng,
                   includingEnds: Bool = true) -> Bool {
         isInRange(from:rng.from, to: rng.to, includingEnds:includingEnds)
    }
    
    func isOutside(_ rng: Rng) -> Bool {
         isOutsideRange(from:rng.from, to: rng.to)
    }
    
    func contains(_ rng: Rng,
                  includingEnds: Bool = true) -> Bool {
         containsRange(from:rng.from,
                             to: rng.to,
                             includingEnds:includingEnds)
    }
    
    //MARK: private
    
    private var _range_from: Int? {
        switch self {
        case .rng(let from, _):
            return from
        default:
            return nil
        }
    }
    
    private var _range_to: Int? {
        switch self {
        case .rng( _, to):
            return to
        default:
            return nil
        }
    }
}

