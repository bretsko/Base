


public protocol ComparableEnumT: Comparable, HasAllFormsT {}

public extension ComparableEnumT {
    static var min: Self {
        allForms.min()!
    }
    static var max: Self {
        allForms.max()!
    }
    var isMin: Bool {
        self == Self.min
    }
    var isMax: Bool {
        self == Self.max
    }
}
