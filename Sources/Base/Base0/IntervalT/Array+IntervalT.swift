

public extension Array where Element: IntervalT {
    
    var starts: [E.U] {
        map{$0.start}
    }
    var ends: [E.U] {
        map{$0.end}
    }
    var allUnits: [E.U] {
        starts + ends
    }
}


//TODO: bridge via array
public extension Set where Element: IntervalT {
    
    var starts: [E.U] {
        map{$0.start}
    }
    var ends: [E.U] {
        map{$0.end}
    }
    var allUnits: [E.U] {
        starts + ends
    }
}


//MARK: -


public extension Array where Element: EIntervalT {
    /// means start == end
    var removingZeroIntervals: Array? {
        L.notImpl()
        // removing(while: {$0.isZeroInterval})
    }
    //TODO: uniques, etc
}

public extension Set where Element: EIntervalT { //? HIntervalT
    var removingZeroIntervals: Set? {
        array.removingZeroIntervals?.set
    }
}


//MARK: -

public extension Array where Element: HIntervalT {
    
    var intervalSet: Set<Element> {
        return set
    }
    
    //TODO: Set funcs, uniques, etc
}


//TODO: bridge via array
//public extension Set where Element: HIntervalT {
//}
