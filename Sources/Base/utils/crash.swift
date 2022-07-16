

// use these like guard ! where unhandled/fatalError must be put inside



/// works like guard !
/// checks if condSatisfied, crashes if not true
public func crashIfFalse(_ condSatisfied: Bool,
                         _ message: Str? = nil) {
    guard !condSatisfied else {
        return
    }
    if let message {
        fatalError(message)
    } else {
        fatalError()
    }
}

/// works like guard !
/// checks if conditionSatisfied, crashes if not true
public func crashIfAnyFalse(_ condsSatisfied: [Bool],
                            _ message: Str? = nil) {
    crashIfFalse(condsSatisfied.allTrue, message)
}



/// works like guard !
/// checks if conditionSatisfied, crashes if not true
public func crashIfNotExpected(_ cond: () -> Bool,
                               expected: Bool = true,
                               _ message: Str? = nil) {
    crashIfFalse(cond() == expected, message)
}
/// works like guard !
/// checks if conditionsSatisfied, crashes if not true
public func crashIfAnyFalse(_ condsSatisfied: [() -> Bool],
                            _ message: Str? = nil) {
    condsSatisfied.forEach {
        crashIfFalse($0(), message)
    }
    //crashIfFalse(condsSatisfied.allTrue, message)
}
/// works like guard !
/// checks if conditionsSatisfied, crashes if not true
public func crashIfAnyFalse(_ condsSatisfied: () -> Bool...,
                            message: Str? = nil) {
    
    condsSatisfied.forEach {
        crashIfFalse($0(), message)
    }
    //crashIfFalse(condsSatisfied.allTrue, message)
}



public func crashIf(_ condSatisfied: Bool,
                    _ message: Str? = nil) {
    crashIfFalse(!condSatisfied, message)
}
/// works like guard !
/// checks if ruleSatisfied, crashes if not true
public func crashIfAnyTrue(_ condsSatisfied: [Bool],
                           _ message: Str? = nil) {
    crashIfFalse(condsSatisfied.allFalse, message)
}


/// works like guard !
/// checks if ruleSatisfied, crashes if not true
//public func crashIfAsExpected(_ cond: () -> Bool,
//                                  expected: Bool = true,
//                                  _ message: Str? = nil) {
//    crashIfNotExpected(cond, expected:expected, message)
//}


//MARK: array

public extension Array where Element == Bool {
    
    /// returns false if empty !
    var allTrue: Bool {
        hasSth && allSatisfy{$0}
    }
    /// returns false if empty !
    var allFalse: Bool {
        hasSth && allSatisfy{$0}
    }
}



/// works like guard !
/// checks if the cndition is equal to expected value, crashes if not
public func crashIfAnyFalse(_ condsSatisfied: Bool...,
                            crashMessage: Str? = nil) {
    
    condsSatisfied.forEach {
        crashIfFalse($0, crashMessage)
    }
}



/// works like guard !
/// checks if all cnditions are equal to expected value, crashes if not
public func crashIfAnyNotExpected(_ conds: () -> Bool...,
                                  expected: Bool = true,
                                  crashMessage: Str? = nil) {
    
    conds.forEach {
        crashIfFalse($0() == expected, crashMessage)
    }
}


/// works like guard !
/// checks if all cnditions are equal to expected value, crashes if not
public func crashIfAnyNotExpected(_ conds: [() -> Bool],
                                  expected: Bool = true,
                                  _ message: Str? = nil) {
    conds.forEach {
        crashIfFalse($0() == expected, message)
    }
    
    //if any of the conds is true
    //    guard conditions.has{$0() == expected} else {
    //        return
    //    }
    //    if let message {
    //        fatalError(message)
    //    } else {
    //        fatalError()
    //    }
}



/// works like guard !
/// checks if ruleSatisfied, crashes if not true
//@inline
//public func crashIfFalse(_ conditionSatisfied: Bool) {
//    if !conditionSatisfied {
//        fatalError()
//    }
//}


/// works like guard !
/// checks if ruleSatisfied, crashes if not true
//@inline(__always)
//public func crashIfFalse(_ conditionSatisfied: Bool) -> Never {
//    if !conditionSatisfied {
//        fatalError()
//    }
//}


/// works like guard !
/// checks if ruleSatisfied, crashes if not true
//@inline
//public func crashIfFalse(_ condition: () -> Bool,
//                       expected: Bool = true) {
//    crashIfFalse(rule() == expected)
//}


/// works like guard !
/// checks if ruleSatisfied, crashes if not true
//@inline(__always)
//public func crashIfFalse(_ condition: () -> Bool,
//                       expected: Bool = true) -> Never {
//    crashIfFalse(condition() == expected)
//}

