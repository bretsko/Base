


//TODO: consider
// adding merging, union, and other set funcs
// storing (optionally?) BoolCond(s)
public struct BoolSetPair<T: Hashable>: Hashable {
    
    public var trues: Set<T>
    
    public var falses: Set<T>
    
    public init(trues: Set<T> = Set<T>(),
                falses: Set<T> = Set<T>()) {
        self.trues = trues
        self.falses = falses
    }
}
public extension BoolSetPair {
    
    init(trues: [T] = [],
         falses: [T] = []) {
        self.init(trues:Set(trues),
                  falses:Set(falses))
    }
    
    var hasTrues: Bool {
        trues.hasSth
    }
    var hasFalses: Bool {
        falses.hasSth
    }
}
