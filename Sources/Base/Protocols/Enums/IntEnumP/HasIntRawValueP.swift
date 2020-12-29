

public protocol HasIntRawValueP: HasIntP {
    
    var rawValue: Int {get}
}
public extension HasIntRawValueP {
    
    //HasIntP
    var int: Int {
        rawValue
    }
}

public extension HasIntRawValueP where Self: Comparable {
    static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}

//public extension HasIntRawValueP where Self: Hashable {
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(rawValue)
//    }
//}

//MARK: IntRawValueInitableP

public protocol IntRawValueInitableP {
    init?(rawValue: Int)
}
//public extension IntRawValueInitableP {}
