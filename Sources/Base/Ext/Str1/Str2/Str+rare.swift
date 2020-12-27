

public extension Str {
    
    
    //MARK: - nums
    
    var int:Int? {
        Int(self)
    }
    var double:Double? {
        Double(self)
    }
    var float: Float? {
        Float(self)
    }
    var int16: Int16? {
        Int16(self)
    }
    var int32: Int32? {
        Int32(self)
    }
    var int64: Int64? {
        Int64(self)
    }
    var int8: Int8? {
        Int8(self)
    }
    
    //MARK: -
    
    ///  Latinize string.
    /// var str = "Hèllö Wórld!"
    /// str.latinize()
    /// print(str) // prints "Hello World!"
    mutating func latinize() {
        self = folding(options: .diacriticInsensitive,
                       locale: .current)
    }
    
    ///  Latinized string.
    /// "Hèllö Wórld!".latinized -> "Hello World!"
    var latinized: Str {
        folding(options: .diacriticInsensitive,
                locale: .current)
    }
    
    //MARK: -
    
    
    ///  Date object from string of date format.
    /// "2017-01-15".date(withFormat: "yyyy-MM-dd") -> Date set to Jan 15, 2017
    /// "not date string".date(withFormat: "yyyy-MM-dd") -> nil
    func date(withFormat format: Str) -> Date? {
        let df = DateFormatter()
        df.dateFormat = format
        return df.date(from: self)
    }
    
    
    //MARK: -
    
    
    /// Converts self to an UUID APNS valid (No "<>" or "-" or spaces).
    /// - Returns: Converts self to an UUID APNS valid (No "<>" or "-" or spaces).
    var readableUUID: Str {
        trimmingCharacters(in: CS(charactersIn: "<>"))
            .replacingOccurrences(of: " ", with: "")
            .replacingOccurrences(of: "-", with: "")
    }
    
    ///  Transforms the string into a slug string.
    /// "Swift is amazing".toSlug() -> "swift-is-amazing"
    /// - Returns: The string in slug format.
    var toSlug: Str {
        let a = lowercased().latinized.replacingOccurrences(of: " ", with: "-")
        
        var s = a.filter {
            guard Str($0) != "-" else { return true }
            guard Str($0) != "&" else { return true }
            return Str($0).rangeOfCharacter(from: CS.alphanumerics) != nil
        }
        
        while s.last?.s == "-" {
            s.removeLast()
        }
        while s.char1 == "-" {
            s.removeFirst()
        }
        
        return s.replacingOccurrences(of: "--", with: "-")
    }
    
    
    var deterministicHash: Int {
        unicodeScalars.map { $0.value }
            .reduce(5381) { ($0 << 5) &+ $0 &+ Int($1) }
    }
    
    ///  Lorem ipsum string of given length.
    /// - Parameter length: number of chars to limit lorem ipsum to (default is 445 - full lorem ipsum).
    /// - Returns: Lorem ipsum dolor sit amet... string.
    static func loremIpsum(ofLength length: Int = 445) -> Str {
        guard length > 0 else { return "" }
        
        // https://www.lipsum.com/
        let loremIpsum = """
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
        """
        if loremIpsum.len > length {
            return Str(loremIpsum[loremIpsum.startIndex ..< loremIpsum.index(loremIpsum.startIndex, offsetBy: length)])
        }
        return loremIpsum
    }
    
    /// Returns the str without diacritics.
    ///
    ///     let str = "Crème brûlée"
    ///     print(str.withoutAccents())
    ///     // Prints "Creme brulee"
    var withoutAccents: Str {
        //#if !os(Linux)
        applyingTransform(.stripCombiningMarks, reverse: false) ?? self
        
        //        #else
        //            return folding(options: .diacriticInsensitive, locale: .current)
        //        #endif
    }
}



/// Returns the latinized version of the string without diacritics.
///
///     let string = "Hello! こんにちは! สวัสดี! مرحبا! 您好!"
///     print(string.latinized())
///     // Prints "Hello! kon'nichiha! swasdi! mrhba! nin hao!"
///
/// - Returns: The latinized version of the string without diacritics.
//    func latinized() -> Str {
//        #if !os(Linux)
//            if #available(iOS 10.0, macOS 10.11, tvOS 10.0, watchOS 3.0, *) {
//                return (applyingTransform(.toLatin, reverse: false) ?? self).withoutAccents()
//            } else {
//                assertionFailure("The latinized function is only available iOS 9.0+, macOS 10.11+, tvOS 9.0+, and watchOS 3.0+")
//                return self.withoutAccents()
//            }
//        #else
//            assertionFailure("The latinized function is only available for Darwin devices; iOS, macOS, tvOS, watchOS")
//            return self.withoutAccents()
//        #endif
//    }

/// Convert argb string to rgba string.
//    var argb2rgba: Str? {
//        guard hasPrefix("#") else {
//            return nil
//        }
//
//        let hexstr = substring(from: index(startIndex, offsetBy: 1))
//        switch hexstr.len {
//        case 4:
//            return "#"
//                + hexstr.substring(from: index(startIndex, offsetBy: 1))
//                + hexstr.substring(to: index(startIndex, offsetBy: 1))
//        case 8:
//            return "#"
//                + hexstr.substring(from: index(startIndex, offsetBy: 2))
//                + hexstr.substring(to: index(startIndex, offsetBy: 2))
//        default:
//            return nil
//        }
//    }
