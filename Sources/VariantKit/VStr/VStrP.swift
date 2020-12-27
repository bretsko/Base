


/// Str variants, hidden behind unique String key, making all objects equal, but allowing storing different variants
public protocol VStrP: HasAllStrVariantsP, HasDescrP {} //HasStrKeyP


public protocol VStrT: VStrP, Hashable {} // StrKeyHashableAndEquatableT, StrKeyComparableT


public protocol VStrEnumP: VStrP, StrEnumP, HasStaticStrKeyP {}
public extension VStrEnumP {

    // convs
    var allVariants: Set<Str> {
        return Self.allVariants
    }
    /// unique str key to repr type, used in hashing and comparing
    var skey: Str {
        return Self.skey
    }
}

public protocol VStrEnumT: VStrEnumP, StrEnumT, VStrT {} //StaticStrKeyHashableAndEquatableT

