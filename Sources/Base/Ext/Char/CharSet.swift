


public extension CharSet {
    typealias CS = CharSet

    static let digits = "0123456789"
    
    static let engVowels = "aeiou" // no y !
    static let engConsonants = "bcdfghjklmnpqrstvwxzy" // has y
    
    static let engLettersLowercased = "abcdefghijklmnopqrstuvwxyz"
    static let engLettersUppercased = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    
    /// all letters, upper and lower case
    static let engLetters = engLettersLowercased + engLettersUppercased
    
    static let engAlphanumericsLowercased = engLettersLowercased + digits
    static let engAlphanumericsUppercased = engLettersUppercased + digits
    static let engAlphanumerics = engLettersLowercased + engLettersUppercased + digits
    
    
    func isSubset(of chars: Str) -> Bool {
        isSubset(of: CS(charactersIn: chars))
    }
    
    func isSuperset(of chars: Str) -> Bool {
        isSuperset(of: CS(charactersIn: chars))
        
        //        #if os(Linux)
        //            // workaround for https://bugs.swift.org/browse/SR-3485
        //            let chars = Set(string.characters)
        //            for char in chars where !contains(char.unicodeScalar) {
        //                return false
        //            }
        //
        //            return true
        //        #else
        // #endif
    }
    
    // static var digits = UnicodeScalar("0")..."9"
    
    /// if any
    var allChars: [Char]? {
        var r = [Char]()
        for plane: UInt8 in 0...16 where hasMember(inPlane: plane) {
            for unicode in UInt32(plane) << 16 ..< UInt32(plane + 1) << 16 {
                if let uniChar = UnicodeScalar(unicode),
                    contains(uniChar) {
                    r.append(Char(uniChar))
                }
            }
        }
        return r.sth
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



// !!!!! all these func below are impl-d in Foundation on Char

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

