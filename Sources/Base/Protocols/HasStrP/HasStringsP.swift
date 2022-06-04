

public protocol HasStrArrayP {
    
    var strings: [Str] {get}
}
public protocol StrHashableT: HasStrArrayP, Hashable {}


public protocol HasStrSetP {
    
    var strs: Set<Str> {get}
}

//public protocol HasMutStringsP: HasStrSetP {
//
//    var strs: Set<Str> {get set}
//}


public protocol StringsHashableT: HasStrSetP, Hashable {}

//public extension StringsHashableT {
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(strs)
//    }
//}


public extension HasStaticStringsP where Self: HasAllFormsT & HasStrP {
    
    static var strs: Set<Str> {
        allForms.map{$0.s}.set
    }
}

