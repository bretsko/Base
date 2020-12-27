

/// a type which can be represented with single unique String
public protocol HasStaticStrKeyP {
    
    /// unique string key, used for hashing and comparing
    static var skey: Str {get}
}
public extension HasStaticStrKeyP where Self: StrEnumT { //HasAllStrVariantsP

    /// unique str key to repr type, used in hashing and comparing
    static var skey: Str {
        return allCases.map{$0.s}[0]
    }
}

