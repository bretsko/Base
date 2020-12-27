

public extension SignedInteger {
    
    
    /// Returns the opposite number.
    var additiveInverse: Self {
        self * -1
    }
    
    var abs: Self {
        Swift.abs(self)
    }
    
    var isPositive: Bool {
        self > 0
    }
    var isNegative: Bool {
        self < 0
    }
    
    var isEven: Bool {
        (self % 2) == 0
    }
    var isOdd: Bool {
        (self % 2) != 0
    }
    
    ///  Str of format (XXh XXm) from seconds Int.
    var timeString: Str {
        guard isPositive else {
            return "0 sec"
        }
        if self < 60 {
            return "\(self) sec"
        }
        if self < 3600 {
            return "\(self / 60) min"
        }
        let hours = self / 3600
        let mins = (self % 3600) / 60
        
        if hours != 0 && mins == 0 {
            return "\(hours)h"
        }
        return "\(hours)h \(mins)m"
    }
    
    
    ///  Greatest common divisor of integer value and n.
    /// - Parameter n: integer value to find gcd with.
    /// - Returns: greatest common divisor of self and n.
    func gcd(of n: Self) -> Self {
        return n == 0 ? self : n.gcd(of: self % n)
    }
    
    ///  Least common multiple of integer and n.
    /// - Parameter n: integer value to find lcm with.
    /// - Returns: least common multiple of self and n.
    func lcm(of n: Self) -> Self {
        (self * n).abs / gcd(of: n)
    }
    
    /**
     Returns a random number between min..<max.
     
     - parameters:
     - min: lower bound
     - max: upper bound. Must be > 0
     
     - Returns:
     Will return 'min' if:
     - 'min' == 'max', since there is no intermediate values
     - 'max - min' > Int32.max, since this value cannot be stored in a SignedInteger
     - 'max - min' <= 1, since arc4random_uniform will return 0 given this input
     
     Else returns a random number between min..<max.
     */
    static func random(min: Self = 0,
                       max: Self = numericCast(Int32.max)) -> Self {
        
        guard min != max else {
            return min
        }
        
        // In the case where 'min' is negative we need to make sure that the 'upperBound'
        // variable below won't contain a value larger than a SignedInteger can hold
        guard (Int64(max) - Int64(min)) <= Int64(Int.max) else {
            return min
        }
        
        let upperBound = (max - min)
        guard upperBound.isPositive else {
            // ar4random_uniform is only callable with UInt and only up to UInt32.max
            return min
        }
        
        // numericCast converts generically between different integer types.
        return numericCast(Darwin.arc4random_uniform(numericCast(upperBound))) + min
    }
    
    ///  Ordinal representation of an integer.
    ///        print((12).ordinalString()) // prints "12th"
    /// - Parameter locale: locale, default is .current.
    /// - Returns: string ordinal representation of number in specified locale language. E.g. input 92, output in "en": "92nd".
    //    func ordinalString(locale: Locale = .current) -> Str? {
    //        let formatter = NumberFormatter()
    //        formatter.locale = locale
    //        formatter.numberStyle = .ordinal
    //        guard let number = self as? NSNumber else { return nil }
    //        return formatter.string(from: number)
    //    }
}

// http://stackoverflow.com/questions/28288148/making-my-function-calculate-average-of-array-swift
public extension Array where Element: BinaryInteger {
    // Sum of all units in array.
    var sum: E? {
        isEmpty ? nil : reduce(0, +)
    }
}


public extension Array where Element: FloatingPoint {
    
    // Average of all units in array.
    var average: E? {
        isEmpty ? nil : reduce(0, +) / E(len)
    }
    
    // Sum of all units in array.
    var sum: E? {
        isEmpty ? nil : reduce(0, +)
    }
}



//
//// MARK: - SignedNumeric
//
//
//
//extension SignedNumeric {
//
//
//    ///  Spelled out representation of a number.
////    ///        print((12.32).spelledOutString()) // prints "twelve point three two"
////    /// - Parameter locale: Locale, default is .current.
//    /// - Returns: Str representation of number spelled in specified locale language. E.g. input 92, output in "en": "ninety-two"
//    func spelledOutString(locale: Locale = .current) -> Str? {
//        let formatter = NumberFormatter()
//        formatter.locale = locale
//        formatter.numberStyle = .spellOut
//
//        guard let number = self as? NSNumber else { return nil }
//        return formatter.string(from: number)
//    }
//}
//
//extension SignedNumeric {
//    ///  Str.
//    var string: Str {
//        return Str(describing: self)
//    }
//
//    ///  Str with number and current locale currency.
//    var asLocaleCurrency: Str {
//        let formatter = NumberFormatter()
//        formatter.numberStyle = .currency
//        formatter.locale = Locale.current
//        guard let number = self as? NSNumber else { return "" }
//        return formatter.string(from: number) ?? ""
//    }
//}
