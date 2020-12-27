

public extension Decimal {
    
    /// by deafult:
    /// rounding mode: NSRoundPlain
    /// scale: No defined scale (full precision)
    /// ignore exactnessException (return nil)
    /// raise on overflow, underflow and divide by zero.
    static func behavior(roundingMode: NSDecimalNumber.RoundingMode = .down,
                         scale: Int16 = 0,
                         raiseOnExactness exact: Bool = false,
                         raiseOnOverflow overflow: Bool = true,
                         raiseOnUnderflow underflow: Bool = true,
                         raiseOnDivideByZero divideByZero: Bool = true) -> NSDecimalNumberHandler {
        
        NSDecimalNumberHandler(roundingMode: roundingMode,
                               scale: scale,
                               raiseOnExactness: exact,
                               raiseOnOverflow: overflow,
                               raiseOnUnderflow: underflow,
                               raiseOnDivideByZero: divideByZero)
    }
    
    //MARK: -
    
    var nsDecimal: NSDecimalNumber {
        NSDecimalNumber(decimal: self)
    }
    
    var double: Double {
        nsDecimal.doubleValue
    }
    
    /// Rounds to nearest integers, for ex. 123.456 -> 123
    var integer: Int {
        nsDecimal.intValue
        //integer(roundedWith: Self.behavior())
    }
    
    /// Returns fractional part of the decimal 123.456 -> 0.456
    var fractionalPart: Decimal {
        self - Decimal(integer)
    }
    
    
    //MARK: rounding
    
    func double(roundedWith behaviour: NSDecimalNumberHandler) -> Double {
        // rounded towards zero
        Double(truncating: nsDecimal.rounding(accordingToBehavior: behaviour))
    }
    
    func integer(roundedWith behaviour: NSDecimalNumberHandler) -> Int {
        // rounded towards zero
        Int(truncating: nsDecimal.rounding(accordingToBehavior: behaviour))
    }
    
    //MARK: - funcs
    
    func adding(_ other: Decimal) -> Decimal {
        var (lhs, rhs) = (self, other)
        var r = Decimal()
        NSDecimalAdd(&r, &lhs, &rhs, .bankers)
        return r
    }
    
    func subtracting(_ other: Decimal) -> Decimal {
        var (lhs, rhs) = (self, other)
        var r = Decimal()
        NSDecimalSubtract(&r, &lhs, &rhs, .bankers)
        return r
    }
    
    func multiplying(by other: Decimal) -> Decimal {
        var (lhs, rhs) = (self, other)
        var r = Decimal()
        NSDecimalMultiply(&r, &lhs, &rhs, .bankers)
        return r
    }
    
    func multiplying(byPowersOf10 index: Int16) -> Decimal {
        var lhs = self
        var r = Decimal()
        NSDecimalMultiplyByPowerOf10(&r, &lhs, index, .bankers)
        return r
    }
    
    func dividing(by other: Decimal) -> Decimal {
        var (lhs, rhs) = (self, other)
        var r = Decimal()
        NSDecimalDivide(&r, &lhs, &rhs, .bankers)
        return r
    }
}


//extension Decimal: Random, RandomInClosedRange {
//
//    /// Generates a random value of `Self`.
//    public static func random<R: RandomGenerator>(using randomGenerator: inout R) -> Decimal {
//        random(in: 0...1, using: &randomGenerator)
//    }
//
//    /// Returns a random value of `Self` inside of the closed range.
//    public static func random<R: RandomGenerator>(in closedRange: ClosedRange<Decimal>, using randomGenerator: inout R) -> Decimal {
//        let multiplier = closedRange.upperBound - closedRange.lowerBound
//        closedRange.lowerBound + multiplier * (Decimal(UInt32.random(using: &randomGenerator)) / Decimal(UInt32.max))
//    }
//
//}
