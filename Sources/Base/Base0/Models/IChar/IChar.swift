

public protocol HasStrCharP { //HasMutStrP
    
    var char: Str {get}
}

public protocol ICharP: HasIdxP, HasStrCharP, HasDescrP {}

public protocol ICharT: ICharP, IdxMutHashableT {}

/// Character + Index
public struct IChar: ICharT {
    
    public var idx: Int
    
    // limitation! cannot repr emoji, try change to Str
    public var char: Str
}
public extension IChar {
    
    init(_ idx: Int = 0, _ char: Str) {
        // only has1 is impl-d
        // later replace with char.isEmpty
        crashIf(!char.has1 || idx < 0)
        self.idx = idx
        self.char = char
    }
    
    init(_ idx: Int = 0, _ char: Char) {
        self.init(idx, char.s)
    }
    
    
    //MARK: -
    
    var ch: Char {
        Char(char)
    }
    var s: Str {
        char
    }
    
    //MARK: -
    
    var descr: Str {
        "IChar: \(idx), \(char)"
    }
}


//MARK: - HasStrCharP

public extension Array where Element: HasStrCharP {
    var chars: [Str] {
        map{$0.char}
    }
}

public extension Set where Element: HasStrCharP {
    var chars: [Str] {
        map{$0.char}
    }
}
