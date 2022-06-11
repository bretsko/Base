

//@_exported import RangeKit


public extension ICSet {
    typealias CS = CharSet
    
    /// filters all punctuation and lowercases
    var preprocessed: ICSet {
        L.notImpl()
        //
        //        var a = self
        //        a.s = s.preprocessed
        //        return a
    }
    
    /// takes 1st char!
    var char1: ICSet? {
        
        L.notImpl()
        //
        //        if let c = s.char1 {
        //            return ICSet(char: c, 0)
        //        }
        //        return nil
    }
    
    var has1: Bool {
        L.notImpl()
        // s.has1
    }
    
    var charSet: Set<Char> {
        L.notImpl()
        // s.charSet
    }
    
    /// newline separated string
    var lines: [ICSet]? {
        L.notImpl()
        // divided(by: CS.newlines)
    }
    
    /// lines with trimmed spaces
    var nonEmptyLines: [ICSet]? {
        L.notImpl()
        // lines?. filter{ $0.s.trimmingSpaces.hasSth }.sth
    }
    
    //    var words: [ICSet]? {
    //        L.notImpl()
    //
    //        
    //        // divided(by: CS.whitespacesAndNewlines)
    //    }
    
    
    func findAll(_ str: ICSet,
                 caseSensitive: Bool = true) -> [ICSet]? {
        
        L.notImpl()
        
        
        //        var s = str
        //        if !caseSensitive {
        //            s = s.lowercased
        //        }
        //        return lowercased.components(separatedBy: s).sth
    }
    
    //TODO:
    //    func occurrences(of str: ICSet,
    //                     caseSensitive: Bool = true) -> [IStr]? {
    //        var s = str
    //        if !caseSensitive {
    //            s = s.lowercased
    //        }
    //        return lowercased.components(separatedBy: s).sth
    //    }
    
    //MARK: has
    
    func has(_ str: ICSet,
             _ caseSensitive: Bool = true) -> Bool {
        
        L.notImpl()
        
        
        //        if caseSensitive {
        //            return contains(str)
        //        } else {
        //            return lowercased.contains(str.lowercased)
        //        }
    }
    
    /// returns false if doesnt contain any of strings
    func hasSome(_ strs: [ICSet],
                 _ caseSensitive: Bool = true) -> Bool {
        L.notImpl()
        
        
        //strs.has{ has($0) }
    }
    func hasAll(_ strs: [ICSet],
                _ caseSensitive: Bool = true) -> Bool {
        L.notImpl()
        
        
        //strs.allSatisfy{ has($0) }
    }
    
    func has(_ charSet: CS,
             _ caseSensitive: Bool = true) -> Bool {
        
        L.notImpl()
        
        
        //        if caseSensitive {
        //            return self.charSet.isSuperset(of: charSet)
        //
        //        } else {
        //            //use ? CS.uppercaseLetters
        //            L.notImpl()
        //        }
    }
    
    func hasOnly(_ charSet: CS,
                 _ caseSensitive: Bool = true) -> Bool {
        L.notImpl()
        
        
        //!has(charSet.inverted, caseSensitive)
    }
    
    /// compares charSets
    func has(chars: ICSet,
             _ caseSensitive: Bool = true) -> Bool {
        L.notImpl()
        
        
        //has(chars.charSet, caseSensitive)
    }
    
    /// compares charSets
    func hasOnly(chars: ICSet,
                 _ caseSensitive: Bool = true) -> Bool {
        
        L.notImpl()
        
        
        //hasOnly(chars.charSet, caseSensitive)
    }
    
    //MARK:
    
    func has(suffix: ICSet,
             _ caseSensitive: Bool = true) -> Bool {
        
        L.notImpl()
        
        
        //        if caseSensitive {
        //            return hasSuffix(suffix)
        //        }
        //        return lowercased.hasSuffix(suffix.lowercased)
    }
    func has(prefix: ICSet,
             _ caseSensitive: Bool = true) -> Bool {
        
        L.notImpl()
        
        //        if caseSensitive {
        //            return hasPrefix(prefix)
        //        }
        //        return lowercased.hasPrefix(prefix.lowercased)
    }
    
    
    func count(of str: ICSet,
               _ caseSensitive: Bool = true) -> Int {
        
        L.notImpl()
        
        
        //        if !caseSensitive {
        //            return lowercased.components(separatedBy: str.lowercased).len - 1
        //        }
        //        return components(separatedBy: str).len - 1
    }
    
    
    //MARK: vowels, consonants
    var hasSpaces: Bool {
        L.notImpl()
        
        
        //contains(" ")
    }
    
    var hasOnlyEngVowels: Bool {
        L.notImpl()
        
        
        //hasOnly(chars: CS.engVowels)
    }
    var hasOnlyEngConsonants: Bool {
        L.notImpl()
        
        
        //hasOnly(chars: CS.engConsonants)
    }
    
    //MARK: -
    
    /// any case
    var startsWithVowel: Bool {
        
        L.notImpl()
        
        
        //        guard let char1 = char1?.lowercased else {
        //            return false
        //        }
        //        return CS.engVowels.has(char1)
    }
    
    /// any case
    var startsWithConsonant: Bool {
        
        L.notImpl()
        
        
        //        guard let char1 = char1?.lowercased else {
        //            return false
        //        }
        //        return CS.engConsonants.has(char1)
    }
    
    /// any case
    var endsWithVowel: Bool {
        
        L.notImpl()
        
        
        //        guard let char = last?.s.lowercased else {
        //            return false
        //        }
        //        return CS.engVowels.has(char)
    }
    
    /// any case
    var endsWithConsonant: Bool {
        
        L.notImpl()
        
        
        //        guard let char = last?.s.lowercased else {
        //            return false
        //        }
        //        return CS.engConsonants.has(char)
    }
    
    
    //MARK: -
    
    /// if nil - any case
    func startsWithVowel(lowercase: Bool? = nil) -> Bool {
        
        L.notImpl()
        
        
        //        guard let char1 = char1?.lowercased else {
        //            return false
        //        }
        //        return CS.engVowels.has(char1)
    }
    
    /// if nil - any case
    func startsWithConsonant(lowercase: Bool? = nil) -> Bool {
        
        L.notImpl()
        
        
        //        guard let char1 = char1?.lowercased else {
        //            return false
        //        }
        //        return CS.engConsonants.has(char1)
    }
    
    /// if nil - any case
    func endsWithVowel(lowercase: Bool? = nil) -> Bool {
        
        L.notImpl()
        
        
        //        guard let char = last?.s.lowercased else {
        //            return false
        //        }
        //        return CS.engVowels.has(char)
    }
    
    /// if nil - any case
    func endsWithConsonant(lowercase: Bool? = nil) -> Bool {
        
        L.notImpl()
        
        
        //        guard let char = last?.s.lowercased else {
        //            return false
        //        }
        //        return CS.engConsonants.has(char)
    }
    
    //MARK: -
    
    
    //    func suffix(len: Int) -> ICSet? {
    //        guard len >= len  else { return nil }
    //        return ICSet(suffix(len))
    //    }
    //    func prefix(len: Int) -> ICSet? {
    //        guard len >= len  else { return nil }
    //        return ICSet(prefix(len))
    //    }
    
    //MARK: filters
    
    func filtering(allowed charSet: CS) -> ICSet? {
        L.notImpl()
        
        
        //components(separatedBy: charSet.inverted).sth?.joined()
    }
    func filtering(disallowed charSet: CS) -> ICSet? {
        L.notImpl()
        
        
        //components(separatedBy: charSet).sth?.joined()
    }
    
    var filteringDecimalDigits: ICSet? {
        L.notImpl()
        
        
        //filtering(allowed: CS.decimalDigits)
    }
    
    var filteringAlphanumerics: ICSet? {
        L.notImpl()
        
        
        //filtering(allowed: CS.alphanumerics)
    }
    
    var filteringPunctuationCharacters: ICSet? {
        L.notImpl()
        
        
        //filtering(allowed: CS.punctuationCharacters)
    }
    
    var filteringLetters: ICSet? {
        L.notImpl()
        
        
        //filtering(allowed: CS.letters)
    }
    
    var filteringLowercaseLetters: ICSet? {
        L.notImpl()
        
        
        //filtering(allowed: CS.lowercaseLetters)
    }
    
    var filteringUppercaseLetters: ICSet? {
        L.notImpl()
        
        
        //filtering(allowed: CS.uppercaseLetters)
    }
    
    var filteringSymbols: ICSet? {
        L.notImpl()
        
        
        //filtering(allowed: CS.symbols)
    }
    
    var filteringWhitespaces: ICSet? {
        L.notImpl()
        
        
        //filtering(allowed: CS.whitespaces)
    }
    
    var filteringNewlines: ICSet? {
        L.notImpl()
        
        
        //filtering(allowed: CS.newlines)
    }
    
    var filteringWhitespacesAndNewlines: ICSet? {
        L.notImpl()
        
        
        //filtering(allowed: CS.whitespacesAndNewlines)
    }
    
    //    func range(of str: ICSet,
    //                  caseSensitive: Bool = true) -> Bool {
    //        if !caseSensitive {
    //            return range(of: str, options: .caseInsensitive) != nil
    //        }
    //        return range(of: str) != nil
    //    }
    
    //MARK:
    
    /// caseSensitive! TODO: caseInSensitive
    var hasEngLetters: Bool {
        L.notImpl()
        
        
        //has(chars: CS.engLetters,false)
    }
    /// caseSensitive! TODO: caseInSensitive
    var hasOnlyEngLetters: Bool {
        L.notImpl()
        
        
        //hasOnly(chars: CS.engLetters,false)
    }
    
    /// caseSensitive! TODO: caseInSensitive
    var hasAlphaNumerics: Bool {
        L.notImpl()
        
        
        //has(CS.alphanumerics,false)
    }
    /// caseSensitive! TODO: caseInSensitive
    var hasOnlyAlphaNumeric: Bool {
        L.notImpl()
        
        
        //hasOnly(CS.alphanumerics,false)
    }
    
    var hasOnlyDigits: Bool {
        L.notImpl()
        
        
        //hasOnly(CS.decimalDigits,false)
    }
    
    ///  Check if the given string has only white spaces
    var hasOnlySpacesAndNewlines: Bool {
        L.notImpl()
        
        
        //hasOnly(CS.whitespacesAndNewlines,false)
    }
    
    var hasUppercasedCharacters: Bool {
        L.notImpl()
        
        
        //has(CS.uppercaseLetters,false)
    }
    var hasLowercasedCharacters: Bool {
        L.notImpl()
        
        
        //has(CS.lowercaseLetters,false)
    }
    
    var hasOnlyUppercasedCharacters: Bool {
        L.notImpl()
        
        
        //hasOnly(CS.uppercaseLetters,false)
    }
    var hasOnlyLowercasedCharacters: Bool {
        L.notImpl()
        
        
        //hasOnly(CS.lowercaseLetters, false)
    }
    
    
    var isDigit: Bool {
        L.notImpl()
        
        
        //hasOnlyDigits
    }
    
    var hasDigits: Bool {
        L.notImpl()
        
        
        //has(CS.digits, false)
    }
    //any numbers ??
    //    var hasNumbers: Bool {
    //        has(CS.decimalDigits)
    //    }
    
    /// any case
    static func endsWithEngLetter(_ str: ICSet,
                                  _ caseSensitive: Bool = true) -> Bool {
        
        L.notImpl()
        
        
        
        //        guard let char = str.last?.s.lowercased else {
        //            return false
        //        }
        //        return CS.engLetters.has(char, caseSensitive)
    }
    
    /// any case
    static func startsWithEngLetter(_ str: ICSet) -> Bool {
        
        L.notImpl()
        
        
        
        //        guard let char1 = str.char1?.lowercased else {
        //            return false
        //        }
        //        return CS.engLetters.has(char1)
    }
    
    /// any case
    var startsWithEngLetter: Bool {
        L.notImpl()
        
        
        //ICSet.startsWithEngLetter(self)
    }
    /// any case
    var endsWithEngLetter: Bool {
        L.notImpl()
        
        
        //ICSet.endsWithEngLetter(self)
    }
    
    //MARK: remove
    
    /// if no prefix - returns nil
    func removing(prefix: ICSet) -> ICSet? {
        
        L.notImpl()
        
        
        //        guard hasPrefix(prefix) else {
        //            return nil
        //        }
        //        let a = removeFirst(prefix.len)
        //        return a.isEmpty ? nil : ICSet(a)
    }
    
    /// if no suffix - returns nil
    func removing(suffix: ICSet) -> ICSet? {
        
        L.notImpl()
        
        
        //        guard hasSuffix(suffix) else {
        //            return nil
        //        }
        //        let a = removeLast(suffix.len)
        //        return a.isEmpty ? nil : ICSet(a)
    }
    
    
    //MARK: mutating
    
    /// if no prefix - no effect
    @discardableResult
    mutating func remove(prefix: ICSet) -> Bool {
        
        L.notImpl()
        
        
        //        if let a = removing(prefix:prefix) {
        //            self = a
        //            return true
        //        }
        //        return false
    }
    
    /// if no suffix - no effect
    @discardableResult
    mutating func remove(suffix: ICSet) -> Bool {
        
        L.notImpl()
        
        
        //        if let a = removing(suffix:suffix) {
        //            self = a
        //            return true
        //        }
        //        return false
    }
    
    //MARK: remove first, last
    
    var removingLast: ICSet? {
        
        L.notImpl()
        
        
        //        let a = removeLast()
        //        return a.isEmpty ? nil : ICSet(a)
    }
    
    /// if num > str length - returns the same string
    func removingLast(_ num: Int) -> ICSet? {
        
        L.notImpl()
        
        
        //        guard len >= num else {
        //            return nil
        //        }
        //        let a = removeLast(num)
        //        return a.isEmpty ? nil : ICSet(a)
    }
    
    var removingFirst: ICSet? {
        
        L.notImpl()
        
        
        //        let a = removeFirst()
        //        return a.isEmpty ? nil : ICSet(a)
    }
    
    /// if num > str length - returns the same string
    func removingFirst(_ num: Int) -> ICSet? {
        
        L.notImpl()
        
        
        //        guard len >= num else {
        //            return nil
        //        }
        //        let a = removeFirst(num)
        //        return a.isEmpty ? nil : ICSet(a)
    }
    
    /// if num > str length - no effect
    @discardableResult
    mutating func removeLast(_ num: Int) -> Bool {
        
        L.notImpl()
        
        
        //        if let a = removingLast(num) {
        //            self = a
        //            return true
        //        } else {
        //            return false
        //        }
    }
    
    /// if num > str length - no effect
    @discardableResult
    mutating func removeFirst(_ num: Int) -> Bool {
        
        L.notImpl()
        
        
        //        if let a = removingFirst(num) {
        //            self = a
        //            return true
        //        } else {
        //            return false
        //        }
    }
    
    @discardableResult
    mutating func removeLast() -> Bool {
        
        L.notImpl()
        
        
        //        if let a = removingLast {
        //            self = a
        //            return true
        //        } else {
        //            return false
        //        }
    }
    
    @discardableResult
    mutating func removeFirst() -> Bool {
        
        L.notImpl()
        
        
        
        //        if let a = removingFirst {
        //            self = a
        //            return true
        //        } else {
        //            return false
        //        }
    }
    
    //MARK: -
    
    var trimmingSpaces: ICSet {
        L.notImpl()
        
        
        //trimmingCharacters(in: .whitespaces)
    }
    var trimmingSpacesAndNewlines: ICSet {
        L.notImpl()
        
        
        //trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    
    //MARK: divided
    
    
    func divided(by charSet: CS) -> [ICSet]? {
        L.notImpl()
        
        
        //components(separatedBy: charSet).sth
    }
    func dividedBy(chars: Str) -> [ICSet]? {
        L.notImpl()
        
        
        //divided(by: chars.charSet)
    }
    
    /// returns nil if doesnt contain given str
    func divided(by str: Str,
                 _ caseSensitive: Bool = true) -> [ICSet]? {
        
        L.notImpl()
        
        
        //
        //        guard has(str, caseSensitive) else {
        //            return nil
        //        }
    }
    
    
    /// returns nil if doesnt contain any of strings
    //    func divided(by strs: [Str],
    //                 _ caseSensitive: Bool = true) -> [ICSet]? {
    //
    //        //TODO: divided several times or once ??
    //        // for ex
    //        // "cat. is, small".divided(by: [",", "."])
    //        // can produce
    //        // 1 - ["cat", "is", "small"]
    //        // 2 - ["cat", "cat, is small"] OR ["cat. is", "small"]
    //
    //
    //        L.notImpl()
    ////        guard has(strs, caseSensitive) else {
    ////            return nil
    ////        }
    ////        return strs.reduce([ICSet], { arr, str in
    ////            if let a = divided(by:str, caseSensitive) {
    ////                return arr + a
    ////            }
    ////            return arr
    ////            //components(separatedBy: str.charSet).sth
    ////        }).sth
    //    }
    
    
    //MARK: removing
    
    @discardableResult
    mutating func removeAll<T: StringProtocol>(of str: T) -> Bool {
        L.notImpl()
        
        
        
        //        let oldLen = len
        //        let a = replacingAll(of: str, with: "")
        //        if oldLen != len {
        //            self = a
        //            return true
        //        }
        //        return false
    }
    func removingAll<T: StringProtocol>(of str: T) -> ICSet {
        L.notImpl()
        
        
        //return replacingAll(of: str, with: "")
    }
    
    @discardableResult
    mutating func removeSpaces() -> Bool {
         removeAll(of: " ")
    }
    var removingSpaces: ICSet? {
         removingAll(of: " ")
    }
    
    @discardableResult
    mutating func removeNewLines() -> Bool {
         removeAll(of: "\n")
    }
    var removingNewLines: ICSet? {
         removingAll(of: "\n")
    }
    
    /// returns false if any fails, but false doesnt mean nothing changed!!
    @discardableResult
    mutating func removeSpacesAndNewLines() -> Bool {
        
        L.notImpl()
        
        
        //return removeSpaces() && removeNewLines()
    }
    var removingSpacesAndNewLines: ICSet? {
        
        L.notImpl()
        
        
        //return removingSpaces?.removingNewLines
    }
    
    
    //MARK: replace
    
    /// if doesnt contain - returns nil
    func replacing(_ substr: ICSet,
                   with newString: ICSet,
                   _ caseSensitive: Bool = true,
                   in rng: Rng? = nil) -> ICSet? {
        
        L.notImpl()
        
        
        //        if caseSensitive {
        //            guard has(substr) else {
        //                return nil
        //            }
        //        } else {
        //            guard lowercased.has(substr.lowercased) else {
        //                return nil
        //            }
        //        }
        //
        //        if let r = rng {
        //            if caseSensitive {
        //                L.notImpl()
        //                // cut string
        //                //return replacingAll(of: substr, with: newString)
        //            } else {
        //                if let foundRng = range(of: substr, options: .caseInsensitive) { //, range: r
        //                    return replacingCharacters(in: foundRng, with: newString)
        //                } else {
        //                    return nil
        //                }
        //            }
        //
        //        } else {
        //
        //            if caseSensitive {
        //                return replacingAll(of: substr, with: newString)
        //
        //            } else if let rng = range(of: substr) {
        //
        //                L.notImpl()
        //                //return replacingAll(of: substr, with: newString)
        //            }
        //            L.notImpl()
        //        }
    }
    
    
    //MARK: -
    
    ///  Check if string contains only unique chars.
    var hasUniqueChars: Bool {
        
        L.notImpl()
        
        
        //        guard hasSth else { return false }
        //        var all = Set<ICSet>()
        //        for char in self {
        //            if all.contains(char.s) {
        //                return false
        //            }
        //            all.insert(char.s)
        //        }
        //        return true
    }
    
    
    /// "find way home" -> "FindWayHome"
    var upperCamelCased: ICSet {
        
        L.notImpl()
        
        
        //return capitalized.components(separatedBy: .whitespacesAndNewlines).joined()
    }
    
    ///  an array of all words in a string
    /// "Swift is amazing".words() -> ["Swift", "is", "amazing"]
    /// - Returns: The words contained in a string.
    var wordsSeparatedByCommas: [ICSet]? {
        
        L.notImpl()
        
        
        
        //        let a = CS.whitespacesAndNewlines.union(.punctuationCharacters)
        //        return components(separatedBy: a). filter{!$0.isEmpty}.sth
    }
    
    
    
    ///  Count of words in a string.
    /// "Swift is amazing".wordsCount -> 3
    /// - Returns: The len of words contained in a string.
    var wordCount: Int {
        
        L.notImpl()
        
        
        
        //        let charSet = CS.whitespacesAndNewlines.union(.punctuationCharacters)
        //        return components(separatedBy: charSet).len{!$0.isEmpty}
    }
    
    // Array of strs separated by given string.
    func splited(by separator: Char) -> [ICSet]? {
        
        L.notImpl()
        
        
        //return split { $0 == separator }.map(ICSet.init).sth
    }
    
    
    func substr(with range: Range<Int>) -> ICSet {
        
        L.notImpl()
        
        
        //        let start = index(startIndex, offsetBy: range.lowerBound)
        //        let end = index(startIndex, offsetBy: Swift.min(chars.len - 1, range.upperBound))
        //
        //        return substr(with: start ..< end)
    }
    
    
    /// animals - imals - 2 = len - 2
    /// Returns a new string containing the chars of the ICSet from the one at a given idx, including it, to the end.
    func substr(from idx: Int) -> ICSet? {
        
        L.notImpl()
        
        
        //        guard hasSth, idx + 1 <= len else {
        //            return nil
        //        }
        //        return ICSet(suffix(len - idx + 1))
        
        //return substr(from: self.index(startIndex, offsetBy: idx))
    }
    
    /// Returns a new string containing the chars of the ICSet up to and including, the one at a given idx.
    func substr(to idx: Int) -> ICSet? {
        
        L.notImpl()
        
        
        //        guard hasSth, idx + 1 <= len else {
        //            return nil
        //        }
        //        return ICSet(prefix(len - idx))
        
        // var i = max(0, min(idx, len - 1))
        // return substr(to: index(startIndex, offsetBy: i))
    }
    
    func substr(from char: Char) -> ICSet? {
        
        L.notImpl()
        
        
        //        guard let i = firstIndex(of: char)  else {
        //            return nil
        //        }
        //        return substr(from: i)
    }
    
    
    func substr(to char: Char) -> ICSet? {
        
        L.notImpl()
        
        
        //        guard let i = index(of: char) else {
        //            return nil
        //        }
        //        return substr(to: i)
    }
    
    func substr(with range: CountableClosedRange<Int>) -> ICSet {
        
        L.notImpl()
        
        
        //return substr(with: Range(uncheckedBounds: (lower: range.lowerBound, upper: range.upperBound + 1)))
    }
    
    var mostCommonChar: Char? {
        L.notImpl()
        
        
        //        return removingSpacesAndNewLines?.reduce(into: [Char: Int]()) {
        //            let len = $0[$1] ?? 0
        //            $0[$1] = len + 1
        //            }.max { $0.1 < $1.1 }?.0
    }
    
    
    //MARK: remove 2
    
    /// if no suffix - returns nil
    func removing(suffix: ICSet,
                  adding suffix2: ICSet) -> ICSet? {
        
        L.notImpl()
        
        
        //        guard hasSuffix(suffix) else {
        //            return nil
        //        }
        //        var s = self
        //        s.remove(suffix: suffix)
        //        return s + suffix2
    }
    
    /// if no prefix1 - returns nil
    func removing(prefix: ICSet,
                  adding prefix2: ICSet) -> ICSet? {
        
        L.notImpl()
        
        
        //        guard hasPrefix(prefix) else {
        //            return nil
        //        }
        //        var s = self
        //        s.remove(prefix: prefix)
        //        return prefix2 + s
    }
    
    
    /// if no suffix - no effect
    mutating func remove(suffix: ICSet,
                         add suffix2: ICSet) -> Bool {
        L.notImpl()
        
        
        //        guard hasSuffix(suffix) else {
        //            return false}
        //        self.removeLast(suffix.len)
        //        self += suffix2
        //        return true
    }
    
    /// if no prefix - no effect
    mutating func remove(prefix: ICSet,
                         add prefix2: ICSet) -> Bool {
        L.notImpl()
        
        
        //        guard hasPrefix(prefix) else {
        //            return false}
        //        self.removeFirst(prefix.len)
        //        self = prefix2 + self
        //        return true
    }
}



//public extension StringProtocol where Index == ICSet.Index {
//
//    ///  The longest common suffix.
//    /// "Hello world!".commonSuffix(with: "It's cold!") = "ld!"
//    /// - Parameters:
//    ///     - Parameter aString: The string with which to compare the receiver.
//    ///     - Parameter options: Options for the comparison.
//    /// - Returns: The longest common suffix of the receiver and the given ICSet
//    func commonSuffix<T: StringProtocol>(with aString: T,
//                                         options: ICSet.CompareOptions = []) -> ICSet {
//        let reversedSuffix = ICSet(reversed()).commonPrefix(with: ICSet(aString.reversed()), options: options)
//        return ICSet(reversedSuffix.reversed())
//    }
//
//}
