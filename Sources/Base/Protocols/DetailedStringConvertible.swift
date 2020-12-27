


//TODO: consider using CustomDebugStringConv, although it has diff sense
public protocol DetailedStringConvertible {
    var descrDetailed: Str {get}
}

public extension Array where Element: DetailedStringConvertible {
    
    var descrDetailed: Str {
        var r = ""
        enumerated().forEach { (i,unit) in
            r += "\n\(i) \(unit.descrDetailed)"
        }
        return r
    }
}

//public func describe<T: HasDescrP>(_ units: [[T]]) -> Str {
//    var r = ""
//    for (i1,row) in units.enumerated() {
//        for (i2,unit) in row.enumerated() {
//            r += "\n\(i1) \(i2) \(unit)"
//        }
//    }
//    return r
//}

//public func describe<T: HasDescrP>(_ units: [T]) -> Str {
//    var r = ""
//    for (i,unit) in units.enumerated() {
//        r += "\n\(i) \(unit)"
//    }
//    return r
//}
