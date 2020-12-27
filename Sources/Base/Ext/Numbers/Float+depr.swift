

///  Value of exponentiation.
///
/// - Parameters:
///   - lhs: base float.
///   - rhs: exponent float.
/// - Returns: exponentiation r (4.4 ** 0.5 = 2.0976176963).
//public func ** (lhs: Float, rhs: Float) -> Float {
//    // http://nshipster.com/swift-operators/
//    return pow(lhs, rhs)
//}

// swiftlint:disable next identifier_name
//prefix operator √
///  Square root of float.
///
/// - Parameter float: float value to find square root for
/// - Returns: square root of given float.
//public prefix func √ (float: Float) -> Float {
//    // http://nshipster.com/swift-operators/
//    return sqrt(float)
//}


//public extension Float {

//public func ==(lhs:Float, rhs:(value:Float, precision: PrecisionDecimals)) -> Bool {
//    return lhs.asIntFromDigits(rhs.precision) == rhs.value.asIntFromDigits(rhs.precision)
//}
//
//public func !=(lhs:Float, rhs:(value:Float, precision: PrecisionDecimals)) -> Bool {
//    return lhs.asIntFromDigits(rhs.precision) != rhs.value.asIntFromDigits(rhs.precision)
//}


//TODO:
//public func ==(lhs:Double, rhs:(value:Double, precision: PrecisionDecimals)) -> Bool {
//    return lhs.asIntFromDigits(rhs.precision) == rhs.value.asIntFromDigits(rhs.precision)
//}
//public func !=(lhs:Double, rhs:(value:Double, precision: PrecisionDecimals)) -> Bool {
//    return lhs.asIntFromDigits(rhs.precision) != rhs.value.asIntFromDigits(rhs.precision)
//}



// Str with number and current locale currency.
//    public var asLocaleCurrency: Str {
//        let formatter = NumberFormatter()
//        formatter.numberStyle = .currency
//        formatter.locale = Locale.current
//        return formatter.string(from: self as NSNumber)!
//    }
//
//    // Ceil of float value.
//    public var ceil: Float {
//        return Foundation.ceil(self)
//    }

// Radian value of degree input.
//    public var degreesToRadians: Float {
//        return Float(Double.pi) * self / 180.0
//    }
//
//    // Floor of float value.
//    public var floor: Float {
//        return Foundation.floor(self)
//    }
//
//    // Degree value of radian input.
//    public var radiansToDegrees: Float {
//        return self * 180 / Float(Double.pi)
//    }
//
//    public func roundToPlaces(places: Int) -> Float {
//        let divisor = pow(10.0, Float(places))
//        return Darwin.round(self * divisor) / divisor
//    }

//    // Random float between two float values.
////    /// - Parameters:
//    ///   - min: minimum number to start random from.
//    ///   - max: maximum number random number end before.
//    /// - Returns: random float between two Float values.
//    public static func randomBetween(min: Float, max: Float) -> Float {
//        let delta = max - min
//        return min + Float(arc4random_uniform(UInt32(delta)))
//    }
//}


//prefix operator ±
/////  Tuple of plus-minus operation.
/////
///// - Parameter int: number
///// - Returns: tuple of plus-minus operation (± 2.5 -> (2.5, -2.5)).
//public prefix func ± <T: FloatingPoint>(number: T) -> (T, T) {
//    // http://nshipster.com/swift-operators/
//    return 0 ± number
//}


//infix operator ±
/////  Tuple of plus-minus operation.
/////
///// - Parameters:
/////   - lhs: number
/////   - rhs: number
///// - Returns: tuple of plus-minus operation ( 2.5 ± 1.5 -> (4, 1)).
//public func ± <T: FloatingPoint>(lhs: T, rhs: T) -> (T, T) {
//    // http://nshipster.com/swift-operators/
//    return (lhs + rhs, lhs - rhs)
//}

