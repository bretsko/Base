

extension Double: HasAllFormsT {}
public extension Double {
    
    /// Returns sorted list of Doubles in the given range
    /// by default from 0 to 1 million
    /// with step 0.1, 0 is not included
    static func gen(min: Double = 0.1,
                    max: Double = 1000000,
                    step: Double = 0.1) -> [Double] {
        stride(from: min, through: max, by: step).array
    }
    
    // HasAllFormsT
    /// Returns a set of Doubles in the range (not all Doubles !) 0 to 1 million,
    /// with step 0.1, 0 is not included
    static var allForms: Set<Self> {
        stride(from: 0.1, through: 1000000, by: 0.1).set
    }
    
    //MARK: -
    
    
    /// The biggest positive number
    static var max: Double {
        greatestFiniteMagnitude
    }
    /// The least positive number
    static var min : Double {
        leastNormalMagnitude
    }
    /// The biggest negative number
    static var max_neg: Double {
        greatestFiniteMagnitude * -1
    }
    /// The least negative number (closest to 0)
    static var min_neg: Double {
        leastNormalMagnitude * -1
    }
    
    /// Computes the combis of the receiver and the parameter
    ///
    /// - parameter k: The number to choose from the receiver
    /// - returns: The number of combis of the receiver and `k`
    func choose(_ k: Double) -> Double {
        precondition(k <= self, "cannot choose more than the receiver")
        return tgamma(self + 1) / (tgamma(k + 1) * tgamma(self - k + 1))
    }
    
    //MARK: - 
    
    var f: Float {
        .init(self)
    }
    
    var i: Int {
        .init(self)
    }
    
    var squared:Double {
        self * self
    }
    
    var d: Double {
        .init(self)
    }
    
    var b: Int8 {
        .init(self)
    }
    
    var ub: UInt8 {
        .init(self)
    }
    
    var s: Int16 {
        .init(self)
    }
    
    var us: UInt16 {
        .init(self)
    }
    
    //    var i: Int32 {
    //        .init(self)
    //    }
    
    var ui: UInt32 {
        .init(self)
    }
    
    var l: Int {
        .init(self)
    }
    
    var ul: UInt {
        .init(self)
    }
    
    var ll: Int64 {
        .init(self)
    }
    
    // MARK: -
    
    func truncate(places: Int) -> Double {
        (Darwin.floor(pow(10.0, places.d) * self) / pow(10.0, places.d)).d
    }
    
    // Absolute of double value.
    var abs: Double {
        Swift.abs(self)
    }
    
    // Str with number and current locale currency.
    var asLocaleCurrency: Str {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        return formatter.string(from: self as NSNumber)!
    }
    
    // Ceil of double value.
    var ceil: Double {
        Foundation.ceil(self)
    }
    
    // Radian value of degree input.
    var degreesToRadians: Double {
        Double.pi * self / 180.0
    }
    
    // Floor of double value.
    var floor: Double {
        Foundation.floor(self)
    }
    
    // Degree value of radian input.
    var radiansToDegrees: Double {
        self * 180 / Double.pi
    }
    
    /// Generate a random Double bounded by a closed interval range.
    static func random(_ range: ClosedRange<Double>) -> Double {
        arc4random().d / UInt64(UINT32_MAX).d * (range.upperBound - range.lowerBound) + range.lowerBound
    }
    
    /// Generate a random Double bounded by a range from min to max.
    static func random(min: Double, max: Double) -> Double {
        random(min ... max)
    }
    
    func roundToPlaces(places: Int) -> Double {
        let divisor = pow(10.0, places.d)
        return Darwin.round(self * divisor) / divisor
    }
    
    
    //    static func random(_ lower: Double = 0, _ upper: Double) -> Double {
    //        Double.random(in: lower...upper)
    //    }
    
    ///returns the number as an Int including the number of digits requested. For example, let x = 4.356 ; x.asIntFromDigits(2) returns 435
    //this allows pseudo-fixed point comparisons
    //    public func asIntFromDigits(_ precision: PrecisionDecimals) -> Int {
    //        Int(floor(self * precision.rawValue.d))
    //    }
    
    func asPercentString() -> Str {
        f.asPercentString()
    }
    
    
    //MARK: -
    
    
    /// Convert `Double` to `Decimal`, rounding it to `scale` decimal places.
    ///
    /// - Parameters:
    ///   - scale: How many decimal places to round to. Defaults to `0`.
    ///   - mode:  The preferred rounding mode. Defaults to `.plain`.
    /// - Returns: The rounded `Decimal` value.
    func roundedDecimal(to scale: Int = 0,
                        _ mode: Decimal.RoundingMode = .plain) -> Decimal {
        var decimalValue = Decimal(self)
        var r = Decimal()
        NSDecimalRound(&r, &decimalValue, scale, mode)
        return r
    }
}


//#if os(Linux)
//    public let DBL_MAX: Double = 1.7976931348623157e+308
//#endif



// MARK: - Operators

precedencegroup PowerPrecedence { higherThan: MultiplicationPrecedence }
infix operator **: PowerPrecedence
///  Value of exponentiation.
///
/// - Parameters:
///   - lhs: base double.
///   - rhs: exponent double.
/// - Returns: exponentiation r (example: 4.4 ** 0.5 = 2.0976176963).
public func ** (lhs: Double, rhs: Double) -> Double {
    // http://nshipster.com/swift-operators/
    pow(lhs, rhs)
}

// swiftlint:disable next identifier_name
prefix operator √
///  Square root of double.
///
/// - Parameter double: double value to find square root for.
/// - Returns: square root of given double.
public prefix func √ (double: Double) -> Double {
    // http://nshipster.com/swift-operators/
    sqrt(double)
}
infix operator ±
// Tuple of plus-minus operation.
///
/// - Parameters:
///   - lhs: double number
///   - rhs: double number
/// - Returns: tuple of plus-minus operation (example: 2.5 ± 1.5 -> (4, 1)).
func ± (lhs: Double, rhs: Double) -> (Double, Double) {
    // http://nshipster.com/swift-operators/
    (lhs + rhs, lhs - rhs)
}

prefix operator ±
// Tuple of plus-minus operation.
///
/// - Parameter int: double number
/// - Returns: tuple of plus-minus operation (example: ± 2.5 -> (2.5, -2.5)).
public prefix func ± (double: Double) -> (Double, Double) {
    // http://nshipster.com/swift-operators/
    0 ± double
}
