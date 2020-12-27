


//MARK: idx validation logic

/// validates idx, crashes if not valid
public func crashIfNegative(_ cond: Bool) {
    crashIfFalse(cond)
}

/// validates idx, crashes if not valid
public func crashIfNegative(_ idx: Int) {
    crashIfNegative(idx >= 0)
}

public func crashIfNotNil(_ obj: Any?) {
    crashIfNegative(obj != nil)
}
public func crashIfNil(_ obj: Any?) {
    crashIfNegative(obj == nil)
}

/// validates indexes, crashes if not valid
public func crashIfNegative(_ indexes: [Int]) {
    indexes.forEach{crashIfNegative($0)}
}

/// validates 2 numbers (maybe array lengths, used to compare arrays of same size), crashes if not valid
public func crashIfNotEqual(_ len1: Int, _ len2: Int) {
    crashIfFalse(len1 == len2)
}

/// does not crash if the array is empty
public func crashIfNotEqual(_ nums: [Int]) {
    if nums.hasSth {
        crashIfFalse( Set(nums).len > 1 )
    }
}


//MARK: -

public extension Array {
    
    /// does not crash if the array is empty
    func crash(if condition: ([E]) -> Bool,
               expected: Bool = true) {
        
        crashIfFalse(condition(self) == expected)
    }
    
    /// does not crash if the array is empty
    func crash(if conditions: [([E]) -> Bool],
               expected: Bool = true) {
        
        //TODO: try to make better, even though crash will happen only once
        conditions.forEach {
            crash(if: $0, expected:expected)
        }
        
        // ??
        //        guard conditions.has{$0() == expected} else {
        //            return
        //        }
        //        if let a = message {
        //            fatalError(a)
        //        } else {
        //            fatalError()
        //        }
    }
}


public extension Set {
    
    /// does not crash if the array is empty
    func crash(if condition: ([E]) -> Bool,
               expected: Bool = true) {
        array.crash(if: condition, expected:expected)
    }
    
    /// does not crash if the array is empty
    func crashIfFalse(_ conditions: [([E]) -> Bool],
                      expected: Bool = true) {
        array.crash(if: conditions, expected:expected)
    }
}
