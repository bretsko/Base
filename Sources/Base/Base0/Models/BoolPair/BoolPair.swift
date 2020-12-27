

//TODO: consider
// adding merging, union, and other set funcs
// storing (optionally?) BoolCond(s)

public struct BoolPair<T> {
    
    public var trues: [T]
    
    public var falses: [T]
    
    public init(trues: [T] = [],
                falses: [T] = []) {
        self.trues = trues
        self.falses = falses
    }
}
public extension BoolPair {
    
    var hasTrues: Bool {
        trues.hasSth
    }
    var hasFalses: Bool {
        falses.hasSth
    }
}
