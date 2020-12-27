

public protocol HasAllStrVariantsP {

    /// all String variants which can represent this type
    static var allVariants: Set<Str> {get}
}
public extension HasAllStrVariantsP  {
    
    /// random variant from allVariants
    static var randVariant: Str! {
        return allVariants.randItem
    }
}

public extension HasAllStrVariantsP where Self: HasStaticStringsP {
    
    static var allVariants: Set<Str> {
        return Set(strs)
    }
}
