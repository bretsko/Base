

//@_exported bimport Base


public extension Str {
    
    /// uses basic regex pattern to check
    var isPhoneNumber: Bool {
         range(of: "\\+?(\\(?\\+?62\\)?[ ]?|0)8[0-9]{1,3}(([ ]|\\-)?[0-9]{3,4}){2}", options: .regularExpression) != nil
    }
    
    
    /// - Note: Note that this property does not validate the email address against an email server. It merely attempts to determine whether its format is suitable for an email address.
    ///
    /// "john@doe.com".isValidEmail -> true
    ///
    var isValidEmail: Bool { // isEmail
        // http://emailregex.com/
        //"[a-zA-Z0-9]+@(gmail|yahoo|hotmail|icloud).co(m|.[a-z]{2})"
        let rfc2822 = "^(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])$"
        
        //        let rfc2822 =
        //            "^(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}" +
        //            "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" +
        //            "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-" +
        //            "z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5" +
        //            "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" +
        //            "9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" +
        //            "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])$"
        
        return matches(regexPattern: rfc2822)
        //range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
    
    
    //TODO: person name, etc
    //    func isAddress: Bool {
    //        return range(of: "^(Jl\\.|Jalan|Komp\\.|Komplek)[ ]*$", options: .regularExpression) != nil
    //    }
    
    
    /// Returns a new string made by first letter of the each Str word.
    //    var initials: Str? {
    //        return divided(by: .whitespacesAndNewlines)?
    //            .filter { $0.hasSth }
    //            .map { $0.substring(to: index(after: startIndex)) }
    //            .joined()
    //    }

    //??
    //    var escapedForXML: Str {
    //        // & needs to go first, otherwise other replacements will be replaced again
    //        let htmlEscapes = [
    //            ("&", "&amp;"),
    //            ("\"", "&quot;"),
    //            ("'", "&apos;"),
    //            (">", "&gt;"),
    //            ("<", "&lt;"),
    //        ]
    //        var r = self
    //        for (k, v) in htmlEscapes {
    //            r = r.replacingOccurrences(of: k, with: v)
    //        }
    //        return r
    //    }
    
    
    /// Note: depends on locale
    /// In North America, "." is the decimal separator,
    /// while in many parts of Europe "," is used,
    ///
    ///        "123".isNumeric -> true
    ///     "1.3".isNumeric -> true (en_US)
    ///     "1,3".isNumeric -> true (fr_FR)
    ///        "abc".isNumeric -> false
    ///
    //    func isNumeric(in locale: Locale = .current) -> Bool {
    //        let scanner = Scanner(string: self)
    //        scanner.locale = locale
    //        return scanner.scanDecimal(nil) && scanner.isAtEnd
    //    }
    
    ///
    /// "abc".isAlphabetic -> true
    /// "123abc".isAlphabetic -> false
    //       var hasOnlyLetters: Bool {
    //           let hasLetters = rangeOfCharacter(from: .letters, options: .numeric, range: nil) != nil
    //           let hasNumbers = rangeOfCharacter(from: .decimalDigits, options: .literal, range: nil) != nil
    //           return hasLetters && !hasNumbers
    //       }
    
}
