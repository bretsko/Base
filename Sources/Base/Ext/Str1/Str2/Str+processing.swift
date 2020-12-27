
//@_exported import RegexKit



public extension Str {

    //MARK: - processing

    //TODO: consider moving to StrFK, and impl as Str or Char Fix models
    enum ProcessingOption: Str, StrEnumT {
        
        case specialChars
        
        case whitespaces
        
        case newlines
        
        //trimming, lowercase, uppercase, collapsingWhitespace, camelCased etc
    }
    
    func preprocessed(with options: Set<ProcessingOption>) -> Str {
        fatalError()
        //        return filter {
        //            !"_-()\"'.:;,!?\n\t".contains($0) }
        //            .trimmingSpacesAndNewlines
        //            .lowercased
    }
    
    
    /// Returns the swap cased version of the str.
    ///
    ///     let str = "Hello World"
    ///     print(str.swapCased())
    ///     // Prints "hELLO wORLD"
    var swapCased: Str {
        map {
            Str($0).isLowercased() ? Str($0).uppercased() : Str($0).lowercased()
        }.joined()
    }
}

///  Converts string format to CamelCase.
/// var str = "sOme vaRiabLe Name"
/// str.camelize()
/// print(str) // prints "someVariableName"
//    var camelized: Str {
//        let src = lowercased
//        let first = src[..<src.index(after: src.startIndex)]
//        if src.hasSpaces {
//            let connected = src.capitalized.removingSpaces
//            let camel = connected.replacingOccurrences(of: "\n", with: "")
//            let rest = Str(camel.removeFirst())
//            return first + rest
//        }
//        let rest = Str(src.removeFirst())
//        return first + rest
//    }


///  CamelCase of string.
/// "sOme vAriable naMe".camelCased -> "someVariableName"
//    var camelCased: Str? {
//        let src = lowercased
//        let first = src[..<src.index(after: src.startIndex)]
//
//        guard src.hasSpaces else {
//            if let rest = src.removingFirst {
//                return first + rest
//            }
//            return first
//        }
//
//        let a = src.capitalized.removingSpaces
//        let camel = connected.removingNewLines,
//        let rest = camel.removingFirst
//        return first + rest
//    }



/**
 Truncates the string to length chars, optionally appending a trailing string. If the string is shorter
 than the required length, then this function is a non-op.
 
 - parameter length:   The length of string required.
 - parameter trailing: An optional addition to the end of the string (increasing "length"), such as ellipsis.
 
 - returns: The truncated string.
 
 Examples:
 
 ```
 "hello there".truncated(to: 5)                   // "hello"
 "hello there".truncated(to: 5, trailing: "...")  // "hello..."
 ```
 
 */
//    func truncated(to length: Int, trailing: Str = "") -> Str {
//        guard !chars.isEmpty, chars.len > length else { return self }
//        return substr(to: index(startIndex, offsetBy: length)) + trailing
//    }
//
//    mutating func truncate(to length: Int, trailing: Str = "") {
//        self = truncated(to: length, trailing: trailing)
//    }


//MARK: padding

///  Pad string to fit the length parameter size with another string in the start.
///   "hue".padStart(10) -> "       hue"
///   "hue".padStart(10, with: "br") -> "brbrbrbhue"
/// - Parameter length: The target length to pad.
/// - Parameter string: Pad string. Default is " ".
//    mutating func padStart(_ length: Int,
//                           with string: Str = " ") {
//        self = paddingStart(length, with: string)
//    }
//
//    ///  Returns a string by padding to fit the length parameter size with another string in the start.
//    ///   "hue".paddingStart(10) -> "       hue"
//    ///   "hue".paddingStart(10, with: "br") -> "brbrbrbhue"
//    /// - Parameter length: The target length to pad.
//    /// - Parameter string: Pad string. Default is " ".
//    /// - Returns: The string with the padding on the start.
//    func paddingStart(_ length: Int,
//                      with string: Str = " ") -> Str {
//        guard len < length else { return self }
//
//        let padLength = length - len
//        if padLength < string.len {
//            return string[string.startIndex ..< string.index(string.startIndex, offsetBy: padLength)] + self
//        } else {
//            var padding = string
//            while padding.len < padLength {
//                padding.append(string)
//            }
//            return padding[padding.startIndex ..< padding.index(padding.startIndex, offsetBy: padLength)] + self
//        }
//    }
//
//    ///  Pad string to fit the length parameter size with another string in the start.
//    ///   "hue".padEnd(10) -> "hue       "
//    ///   "hue".padEnd(10, with: "br") -> "huebrbrbrb"
//    /// - Parameter length: The target length to pad.
//    /// - Parameter string: Pad string. Default is " ".
//    mutating func padEnd(_ length: Int,
//                         with string: Str = " ") {
//        self = paddingEnd(length, with: string)
//    }
//
//    ///  Returns a string by padding to fit the length parameter size with another string in the end.
//    ///   "hue".paddingEnd(10) -> "hue       "
//    ///   "hue".paddingEnd(10, with: "br") -> "huebrbrbrb"
//    /// - Parameter length: The target length to pad.
//    /// - Parameter string: Pad string. Default is " ".
//    /// - Returns: The string with the padding on the end.
//    func paddingEnd(_ length: Int,
//                    with string: Str = " ") -> Str {
//        guard len < length else { return self }
//
//        let padLength = length - len
//        if padLength < string.len {
//            return self + string[string.startIndex ..< string.index(string.startIndex, offsetBy: padLength)]
//        } else {
//            var padding = string
//            while padding.len < padLength {
//                padding.append(string)
//            }
//            return self + padding[padding.startIndex ..< padding.index(padding.startIndex, offsetBy: padLength)]
//        }
//    }
//
//
//    //MARK: truncate
//
//    ///  Truncate string (cut it to a given number of chars).
//    /// var str = "This is a very long sentence"
//    /// str.truncate(toLength: 14)
//    /// print(str) // prints "This is a very..."
//    /// - Parameters:
//    ///   - toLength: maximum number of chars before cutting.
//    ///   - trailing: string to add at the end of truncated string (default is "...").
//    mutating func truncate(toLength length: Int,
//                           trailing: Str? = "...") {
//        guard length > 0 else { return }
//        if len > length {
//            self = self[startIndex ..< index(startIndex, offsetBy: length)] + (trailing ?? "")
//        }
//    }
//
//    ///  Truncated string (limited to a given number of chars).
//    /// "This is a very long sentence".truncated(toLength: 14) -> "This is a very..."
//    /// "Short sentence".truncated(toLength: 14) -> "Short sentence"
//    /// - Parameters:
//    ///   - toLength: maximum number of chars before cutting.
//    ///   - trailing: string to add at the end of truncated string.
//    /// - Returns: truncated string (this is an extr...).
//    func truncated(toLength length: Int,
//                   trailing: Str? = "...") -> Str {
//        guard 1 ..< len ~= length else { return self }
//        return self[startIndex ..< index(startIndex, offsetBy: length)] + (trailing ?? "")
//    }


/// Get the character at a given idx.
//    func character(at idx: Int) -> Char {
//        return self[index(startIndex, offsetBy: idx)]
//    }
//}




//
//
////TODO: check that I dont have the same in Base
//// try move all exts there
//public extension Str {
//
//    /// Replacing last space with non-breaking space to avoid orphans.
//    ///
//    /// - returns: New string with last space replaced with non-breaking space.
//    var removingOrphan: Str {
//        get {
//            if let range = rangeOfCharacter(from: CS(charactersIn: " "),
//                                            options: .backwards,
//                                            range: nil) {
//                return replacingCharacters(in: range,
//                                           with: "\u{00a0}")
//            }
//            return self
//        }
//    }
//
//}
