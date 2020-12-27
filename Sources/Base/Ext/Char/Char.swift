



public extension Char {
    typealias CS = CharSet

    /// Str(self)
    var s: Str {
        Str(self)
    }
    
    var unicodeScalar: UnicodeScalar {
        unicodeScalars.first!
    }
    
    /// wholeNumberValue
    var int: Int? {
        wholeNumberValue
    }
    /// isWholeNumber
    var isInt: Bool {
        isWholeNumber
    }
    
    
    //MARK: - Bool vars
    
    /// 0123456789
    var isDigit: Bool {
        CS.digits.contains(s)
    }
    
    /// aeiou, but not y 
    var isVowel: Bool {
        CS.engVowels.contains(s)
    }
    
    /// bcdfghjklmnpqrstvwxz + y(!)
    var isConsonant: Bool {
        isLetter //CS.engConsonants.contains(s)
    }
    
    var isEngLetterLowercased: Bool {
        CS.engLettersLowercased.contains(self)
    }
    var isEngLetterUppercased: Bool {
        CS.engLettersUppercased.contains(self)
    }
    /// any case
    var isEngLetter: Bool {
        CS.engLetters.contains(self)
    }
    
    var isEngAlphanumericLowercased: Bool {
        CS.engAlphanumericsLowercased.contains(self)
    }
    var isEngAlphanumericUppercased: Bool {
        CS.engAlphanumericsUppercased.contains(self)
    }
    /// any case
    var isEngAlphanumerics: Bool {
        CS.engAlphanumerics.contains(self)
    }
    
   
    //TODO: unicode
    //    var isLetter: Bool {
    //        CS.letters.contains(unicodeScalar)
    //    }
    
    //move to string??
    //    var isDecimalDigit: Bool {
    //        CS.decimalDigits.contains(unicodeScalar)
    //    }
    
    
    //MARK -
    
    //TODO: try make without converting to Str
//    var isUppercased: Bool {
//        s == s.uppercased(with: locale)
//    }
//
//    var isLowercased: Bool {
//        s == s.lowercased
//    }
//
//    var isWhiteSpace: Bool {
//        s == " "
//    }
//
//    var lowercased: Char {
//        s.lowercased[0]
//    }
//
//    var uppercased: Char {
//        s.uppercased[0]
//    }
    
    
    //MARK: random
    
    /// 0-9
    static var randDigit: Char {
        let a = CS.digits
        //r(CS.decimalDigits)
        return randChar(a)
    }
    static func randChar(_ chars: Str) -> Char {
        let num = Int.rand(chars.len)
        let i = chars.index(chars.startIndex, offsetBy: num)
        return chars[i]
    }
    static func randChar(_ chars: [Str]) -> Char {
        randChar(chars.joined())
    }
    
    
    ///  any case
    static var randEngLetter: Char {
        randChar(CS.engLetters)
    }
    /// any case
    static var randEngAlphanumeric: Char {
        randChar(CS.engAlphanumerics)
    }
    
    static var randEngLetterLowercased: Char {
        randChar(CS.engLettersLowercased)
    }
    static var randEngLetterUppercased: Char {
        randChar(CS.engLettersUppercased)
    }
}


// can change casing !
//var isCased: Bool

// func lowercased() -> Str
// isLowercase
// func uppercased() -> Str
// isUppercase

// isSymbol
// isMathSymbol
// isCurrencySymbol
// isPunctuation

// var isNumber: Bool
// var isWholeNumber: Bool
// var wholeNumberValue: Int?
// var hexDigitValue: Int?
// var isLetter



// !!!!! all these func below are impl-d in Foundation

///// A Boolean value indicating whether this character represents a number.
/////
///// For example, the following characters all represent numbers:
/////
///// - "7" (U+0037 DIGIT SEVEN)
///// - "⅚" (U+215A VULGAR FRACTION FIVE SIXTHS)
///// - "㊈" (U+3288 CIRCLED IDEOGRAPH NINE)
///// - "𝟠" (U+1D7E0 MATHEMATICAL DOUBLE-STRUCK DIGIT EIGHT)
///// - "๒" (U+0E52 THAI DIGIT TWO)
//public var isNumber: Bool { get }
//
///// A Boolean value indicating whether this character represents a whole
///// number.
/////
///// For example, the following characters all represent whole numbers:
/////
///// - "1" (U+0031 DIGIT ONE) => 1
///// - "५" (U+096B DEVANAGARI DIGIT FIVE) => 5
///// - "๙" (U+0E59 THAI DIGIT NINE) => 9
///// - "万" (U+4E07 CJK UNIFIED IDEOGRAPH-4E07) => 10_000
//@inlinable public var isWholeNumber: Bool { get }
//
///// The numeric value this character represents, if it represents a whole
///// number.
/////
///// If this character does not represent a whole number, or the value is too
///// large to represent as an `Int`, the value of this property is `nil`.
/////
/////     let chars: [Character] = ["4", "④", "万", "a"]
/////     for ch in chars {
/////         print(ch, "-->", ch.properties.numericValue)
/////     }
/////     // 4 --> 4
/////     // ④ --> 4
/////     // 万 --> 10000
/////     // a --> nil
//public var wholeNumberValue: Int? { get }
//
///// A Boolean value indicating whether this character represents a
///// hexadecimal digit.
/////
///// Hexadecimal digits include 0-9, Latin letters a-f and A-F, and their
///// fullwidth compatibility forms. To get the character's value, use the
///// `hexDigitValue` property.
//@inlinable public var isHexDigit: Bool { get }
//
///// The numeric value this character represents, if it is a hexadecimal digit.
/////
///// Hexadecimal digits include 0-9, Latin letters a-f and A-F, and their
///// fullwidth compatibility forms. If the character does not represent a
///// hexadecimal digit, the value of this property is `nil`.
/////
/////     let chars: [Character] = ["1", "a", "Ｆ", "g"]
/////     for ch in chars {
/////         print(ch, "-->", ch.hexDigitValue)
/////     }
/////     // 1 --> 1
/////     // a --> 10
/////     // Ｆ --> 15
/////     // g --> nil
//public var hexDigitValue: Int? { get }
//
///// A Boolean value indicating whether this character is a letter.
/////
///// For example, the following characters are all letters:
/////
///// - "A" (U+0041 LATIN CAPITAL LETTER A)
///// - "é" (U+0065 LATIN SMALL LETTER E, U+0301 COMBINING ACUTE ACCENT)
///// - "ϴ" (U+03F4 GREEK CAPITAL THETA SYMBOL)
///// - "ڈ" (U+0688 ARABIC LETTER DDAL)
///// - "日" (U+65E5 CJK UNIFIED IDEOGRAPH-65E5)
///// - "ᚨ" (U+16A8 RUNIC LETTER ANSUZ A)
//public var isLetter: Bool { get }
//
///// Returns an uppercased version of this character.
/////
///// Because case conversion can result in multiple characters, the result
///// of `uppercased()` is a string.
/////
/////     let chars: [Character] = ["e", "é", "и", "π", "ß", "1"]
/////     for ch in chars {
/////         print(ch, "-->", ch.uppercased())
/////     }
/////     // e --> E
/////     // é --> É
/////     // и --> И
/////     // π --> Π
/////     // ß --> SS
/////     // 1 --> 1
//public func uppercased() -> Str
//
///// Returns a lowercased version of this character.
/////
///// Because case conversion can result in multiple characters, the result
///// of `lowercased()` is a string.
/////
/////     let chars: [Character] = ["E", "É", "И", "Π", "1"]
/////     for ch in chars {
/////         print(ch, "-->", ch.lowercased())
/////     }
/////     // E --> e
/////     // É --> é
/////     // И --> и
/////     // Π --> π
/////     // 1 --> 1
//public func lowercased() -> Str
//
///// A Boolean value indicating whether this character is considered uppercase.
/////
///// Uppercase characters vary under case-conversion to lowercase, but not when
///// converted to uppercase. The following characters are all uppercase:
/////
///// - "É" (U+0045 LATIN CAPITAL LETTER E, U+0301 COMBINING ACUTE ACCENT)
///// - "И" (U+0418 CYRILLIC CAPITAL LETTER I)
///// - "Π" (U+03A0 GREEK CAPITAL LETTER PI)
//@inlinable public var isUppercase: Bool { get }
//
///// A Boolean value indicating whether this character is considered lowercase.
/////
///// Lowercase characters change when converted to uppercase, but not when
///// converted to lowercase. The following characters are all lowercase:
/////
///// - "é" (U+0065 LATIN SMALL LETTER E, U+0301 COMBINING ACUTE ACCENT)
///// - "и" (U+0438 CYRILLIC SMALL LETTER I)
///// - "π" (U+03C0 GREEK SMALL LETTER PI)
//@inlinable public var isLowercase: Bool { get }
//
///// A Boolean value indicating whether this character changes under any form
///// of case conversion.
//@inlinable public var isCased: Bool { get }
//
///// A Boolean value indicating whether this character represents a symbol.
/////
///// This property is `true` only for characters composed of scalars in the
///// "Math_Symbol", "Currency_Symbol", "Modifier_Symbol", or "Other_Symbol"
///// categories in the
///// [Unicode Standard](https://unicode.org/reports/tr44/#General_Category_Values).
/////
///// For example, the following characters all represent symbols:
/////
///// - "®" (U+00AE REGISTERED SIGN)
///// - "⌹" (U+2339 APL FUNCTIONAL SYMBOL QUAD DIVIDE)
///// - "⡆" (U+2846 BRAILLE PATTERN DOTS-237)
//public var isSymbol: Bool { get }
//
///// A Boolean value indicating whether this character represents a symbol
///// that naturally appears in mathematical contexts.
/////
///// For example, the following characters all represent math symbols:
/////
///// - "+" (U+002B PLUS SIGN)
///// - "∫" (U+222B INTEGRAL)
///// - "ϰ" (U+03F0 GREEK KAPPA SYMBOL)
/////
///// The set of characters that have an `isMathSymbol` value of `true` is not
///// a strict subset of those for which `isSymbol` is `true`. This includes
///// characters used both as letters and commonly in mathematical formulas.
///// For example, "ϰ" (U+03F0 GREEK KAPPA SYMBOL) is considered both a
///// mathematical symbol and a letter.
/////
///// This property corresponds to the "Math" property in the
///// [Unicode Standard](http://www.unicode.org/versions/latest/).
//public var isMathSymbol: Bool { get }
//
///// A Boolean value indicating whether this character represents a currency
///// symbol.
/////
///// For example, the following characters all represent currency symbols:
/////
///// - "$" (U+0024 DOLLAR SIGN)
///// - "¥" (U+00A5 YEN SIGN)
///// - "€" (U+20AC EURO SIGN)
//public var isCurrencySymbol: Bool { get }
//
///// A Boolean value indicating whether this character represents punctuation.
/////
///// For example, the following characters all represent punctuation:
/////
///// - "!" (U+0021 EXCLAMATION MARK)
///// - "؟" (U+061F ARABIC QUESTION MARK)
///// - "…" (U+2026 HORIZONTAL ELLIPSIS)
///// - "—" (U+2014 EM DASH)
///// - "“" (U+201C LEFT DOUBLE QUOTATION MARK)
//public var isPunctuation: Bool { get }




/// uppercased or lowercased
//    static var randLetter: Char {
//        fatalError()
//        //        let a = Eng.letters + Eng.letters.map{$0.uppercased}
//        //        return randChar(a)
//    }
//
//    static var randLetterLowercased: Char {
//        fatalError()
//        //        let a = Eng.letters
//        //        return randChar(a)
//    }
//    static var randLetterUppercased: Char {
//        fatalError()
//        //        let a = Eng.letters.map{$0.uppercased}
//        //        return randChar(a)
//    }
//
//    static var randAlphanumeric: Char {
//        fatalError()
//        //"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
//        //        let a = Eng.letters + Eng.letters.map{$0.uppercased}
//        //        return randChar(a)
//    }



// MARK: - Operators

///  Repeat character multiple times.
///        Char("-") * 10 -> "----------"
/// - Parameters:
///   - lhs: character to repeat.
///   - rhs: number of times to repeat character.
/// - Returns: string with character repeated n times.
//    static func * (lhs: Char, rhs: Int) -> Str {
//        guard rhs > 0 else {
//            return ""
//        }
//        return Str(repeating: Str(lhs), count: rhs)
//    }
//
//    ///  Repeat character multiple times.
//    /// 10 * Char("-") -> "----------"
//    /// - Parameters:
//    ///   - lhs: number of times to repeat character.
//    ///   - rhs: character to repeat.
//    /// - Returns: string with character repeated n times.
//    static func * (lhs: Int, rhs: Char) -> Str {
//        guard lhs > 0 else {
//            return ""
//        }
//        return Str(repeating: Str(rhs), count: lhs)
//    }

