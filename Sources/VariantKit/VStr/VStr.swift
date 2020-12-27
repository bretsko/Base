
/// Str Variants model represents cases which can be regarded equivalent
/// Each string in nested enums are considered equal in most cases
public enum VStr: VStrT, Hashable {
    
    case strs(Set<Str>)
    
    case person(SVPerson)
    // etc
    
    
    //??
    // order doesnt matter, all elements are equal
    //case strs([Str])
    
    //case strEnum(StrEnumP) //?
}


//MARK: -

//public extension Array where Element: VStr {
//
//    var skeys: [Str] {
//        return map{$0.skey}
//    }
//}

//    /// ["a", "b"] -> ["a b"]
//    func makeStr(joinedWith: Str = " ") -> Str {
//        return strs.joined()
//    }
//
//    //    func allContain(_ str: Str) -> Bool {
//    //        return array.allContain(str)
//    //    }
//    //    func noneContain(_ str: Str) -> Bool {
//    //        return array.noneContain(str)
//    //    }
//}
