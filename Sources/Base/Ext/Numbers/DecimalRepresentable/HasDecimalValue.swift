


public protocol HasDecimalValueP {
    
    var value: Decimal { get }
}

public extension HasDecimalValueP {
    
    var doubleValue: Double {
        nsDecimal.doubleValue
    }
    var integerValue: Int {
        nsDecimal.intValue
    }
    var nsDecimal: NSDecimalNumber {
        value.nsDecimal
    }
    /// Returns fractional part of the decimal 123.456 -> 0.456
    var fractionalPart: Decimal {
        value - Decimal(integerValue)
    }
}




