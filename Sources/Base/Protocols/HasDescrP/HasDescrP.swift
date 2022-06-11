

// used by StrEnumT, don't want to use CustomStringConvertible - in order to be able to init with caseName
public protocol HasDescr {
    
    var descr: Str {get}
}

// used by StrEnumP and others
public protocol HasDescrP: HasDescr, CustomStringConvertible {}
public extension HasDescrP {
    var description: Str {
        descr
    }
}


//MARK: -

public extension Array where Element: HasDescr {
    /// 1D array with indices
    var descr: Str {
        var r = ""
        enumerated().forEach { i,unit in
            r += "\n\(i) \(unit)"
        }
        return r
    }
}

public extension Array where Element: CustomStringConvertible {
    
    /// 1D array with indices
    var description: Str {
        var r = ""
        enumerated().forEach { i,unit in
            r += "\n\(i) \(unit)"
        }
        return r
    }
}

public extension Array where Element: RandomAccessCollection, Element.Element: HasDescr {
    
    /// 2D array with indices
    var descr2: Str {
        var r = ""
        enumerated().forEach { i1, row in
            row.enumerated().forEach { i2, unit in
                r += "\n\(i1) \(i2) \(unit)"
            }
        }
        return r
    }
}

extension Set: HasDescr {
    public var descr: Str {
        description
    }
}
//extension Array: HasDescr {
//    public var descr: Str {
//        description
//    }
//}

