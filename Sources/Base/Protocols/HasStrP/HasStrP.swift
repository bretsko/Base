


public protocol HasStrP {
    
    var str: Str {get}
}
public extension HasStrP {
    var s: Str {
        str
    }
}

public protocol HasMutStrP: HasStrP {
    
    var str: Str {get set}
}
public extension HasMutStrP {
    
    var s: Str {
        get {
            str
        }
        set {
            str = newValue
        }
    }
}

public protocol HasStaticStringsP {
    
    static var strs: Set<Str> {get}
}

public extension HasAllFormsT where Self: HasStrP {
    
    static var allStrs: Set<Str> {
        allForms.map{$0.s}.set
    }
}

// used to transl numbers in diff locales
//public protocol HasStaticAllStringsP {
//    
//    /// for Doubles, Decimals this is limited to some default values
//    static func allStrings(with locale: LocaleID) -> Set<Str>
//}


public protocol StringHashableT: HasStrP, Hashable {}
public extension StringHashableT {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(str)
    }
}

public protocol StringComparableT: HasStrP, Comparable {}

public extension StringComparableT {
    static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.str < rhs.str
    }
}


//MARK: - Array

public extension Array where Element: HasStrP {
    
    var strs: [Str] {
        map{$0.s}
    }
    
    /// ["a", "b"] -> ["a b"]
    func makeStr(joinedWith: Str = " ") -> Str {
        strs.joined()
    }
    
    /// filter {$0.str == str}
    func filter(with str: Str) -> Array {
        filter {$0.str == str}
    }
    /// filter {$0.str != str}
    func filter(without str: Str) -> Array {
        filter {$0.str != str}
    }
}


public extension Set where Element: HasStrP {
    
    /// filter {$0.str == str}
    func filter(with str: Str) -> Set {
        filter {$0.str == str}.set
    }
    /// filter {$0.str != str}
    func filter(without str: Str) -> Set {
        filter {$0.str != str}
    }
}


