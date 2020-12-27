

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

// CustomStringConvertible
extension Array: HasDescr {
    public var descr: Str {
        description
    }
}

public extension Array where Element: HasDescr {
    
    var descr: Str {
        var r = ""
        enumerated().forEach { i,unit in
            r += "\n\(i) \(unit)"
        }
        return r
    }
}

public extension Array where Element: CustomStringConvertible {
    
    var descr: Str {
        var r = ""
        enumerated().forEach { i,unit in
            r += "\n\(i) \(unit)"
        }
        return r
    }
}

public extension Array where Element: RandomAccessCollection, Element.Element: HasDescr {
    
    var descr: Str {
        var r = ""
        enumerated().forEach { i1, row in
            row.enumerated().forEach { i2, unit in
                r += "\n\(i1) \(i2) \(unit)"
            }
        }
        return r
    }
}

