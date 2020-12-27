


/// Str var Person
public enum SVPerson: Str, VStrEnumT, Hashable {
    
    case person, man
    
    // have to override here, otherwise get warning in Str enum
    public func hash(into hasher: inout Hasher) {
        hasher.combine(Self.skey)
    }
    
    // all variants are equal
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return true
    }
}
