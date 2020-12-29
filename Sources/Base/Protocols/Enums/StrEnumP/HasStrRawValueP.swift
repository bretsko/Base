

public protocol HasStrRawValueP: HasStrP {
    
    var rawValue: Str {get}
}
public extension HasStrRawValueP {
    
    var s: Str {
        rawValue
    }
    //HasStrP
    var str: Str {
        rawValue
    }
}


public extension HasStrRawValueP where Self: Comparable {
    static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}

//public extension HasStrRawValueP where Self: Hashable {
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(rawValue)
//    }
//}


//MARK: StrRawValueInitableP

public protocol StrRawValueInitableP: InitsWithStr_P {
    
    init?(rawValue: Str)
}
public extension StrRawValueInitableP {
    
    init?(_ str: Str) {
        self.init(rawValue: str)
    }
}


