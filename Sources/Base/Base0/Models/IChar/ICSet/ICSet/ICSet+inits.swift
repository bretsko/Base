


public extension ICSet {
    
    init(_ str: Str, _ idxSet: Set<Int>) {
        crashIf(str.len != idxSet.len)
        
        self = Set(zip(str,idxSet).map{IChar($0.1, $0.0)})
    }
    
    init(_ str: Str, _ indexes: [Int]) {
        self.init(str, Set<Int>(indexes))
    }
    
    init(_ str: Str, startFrom: Int = 0) {
        crashIf(str.isEmpty)
        
        //self = Set( str.enumerated().map {IChar(startFrom + $0, $1) })
        
        self.init(str, Array(startFrom...str.len))
    }
    
    
    //    init(_ strs: [Str]) {
    //        self.init(strs.joined())
    //    }
    //    /// merges icsets
    //    init(_ icsets: [ICSet]) {
    //        L.notImpl()
    //    }
    
    //MARK: -
    
    /// currently used to refer to parts of Phrase
    var range: Rng {
        L.notImpl()
    }
    
    //    var makeStr: Str {
    //        return
    //    }
    
    //MARK: -
    
    //    var descr: Str {
    //        return "ICSet, \(str), \(range)"
    //    }
}


public extension Array where Element == Str {
    var icSet: Set<IChar> {
        return Set(enumerated().map { IChar($0, $1) })
    }
}

public extension Array where Element == Char {
    var icSet: Set<IChar> {
        return Set(enumerated().map { IChar($0, $1) })
    }
}

public extension Str {
    var icSet: Set<IChar> {
        return chars.icSet
    }
}
