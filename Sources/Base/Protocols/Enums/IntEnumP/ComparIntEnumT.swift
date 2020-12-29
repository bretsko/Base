

/// has 3 or more cases, but at least:  smaller = -1, same = 0, bigger = 1
public protocol ComparIntEnumT: IntEnumT {}

public extension ComparIntEnumT {
    /// for bigger returns smalle, and vice versa
    var antonym: Self? {
        if rawValue == 0 {
            return nil
        }
        return Self(rawValue: rawValue * -1)
    }
}

//TODO: array/set extensions

