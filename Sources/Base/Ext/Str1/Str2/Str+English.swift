

public extension Str {
    
    //MARK: - vowels, consonants
    
    var hasOnlyEngVowels: Bool {
        hasOnly(chars: CS.engVowels)
    }
    var hasOnlyEngConsonants: Bool {
        hasOnly(chars: CS.engConsonants)
    }
    
    func hasSpaces(in rng: Rng) -> Bool {
        L.notImpl()
        
        // contains(" ")
    }
    
    func hasOnlyEngVowels(in rng: Rng) -> Bool {
        L.notImpl()
        
        // hasOnly(chars: CS.engVowels)
    }
    
    func hasOnlyEngConsonants(in rng: Rng) -> Bool {
        L.notImpl()
        
        // hasOnly(chars: CS.engConsonants)
    }
    
    
    //MARK: -
    
    /// any case
    var startsWithVowel: Bool {
        guard let char1 = char1?.lowercased() else {
            return false
        }
        return CS.engVowels.has(char1)
    }
    
    /// any case
    var startsWithConsonant: Bool {
        guard let char1 = char1?.lowercased() else {
            return false
        }
        return CS.engConsonants.has(char1)
    }
    
    /// any case
    var endsWithVowel: Bool {
        guard let char = last?.s.lowercased() else {
            return false
        }
        return CS.engVowels.has(char)
    }
    
    /// any case
    var endsWithConsonant: Bool {
        guard let char = last?.s.lowercased() else {
            return false
        }
        return CS.engConsonants.has(char)
    }
    
    //MARK:
    
    //    func suffix(len: Int) -> Str? {
    //        guard len >= len  else { return nil }
    //        return Str(suffix(len))
    //    }
    //    func prefix(len: Int) -> Str? {
    //        guard len >= len  else { return nil }
    //        return Str(prefix(len))
    //    }
    
    //MARK: filters
    
    func filtering(allowed charSet: CS) -> Str? {
        components(separatedBy: charSet.inverted).sth?.joined()
    }
    func filtering(disallowed charSet: CS) -> Str? {
        components(separatedBy: charSet).sth?.joined()
    }
    
    var filteringDecimalDigits: Str? {
        filtering(allowed: CS.decimalDigits)
    }
    
    var filteringAlphanumerics: Str? {
        filtering(allowed: CS.alphanumerics)
    }
    
    var filteringPunctuationCharacters: Str? {
        filtering(allowed: CS.punctuationCharacters)
    }
    
    var filteringLetters: Str? {
        filtering(allowed: CS.letters)
    }
    
    var filteringLowercaseLetters: Str? {
        filtering(allowed: CS.lowercaseLetters)
    }
    
    var filteringUppercaseLetters: Str? {
        filtering(allowed: CS.uppercaseLetters)
    }
    
    var filteringSymbols: Str? {
        filtering(allowed: CS.symbols)
    }
    
    var filteringWhitespaces: Str? {
        filtering(allowed: CS.whitespaces)
    }
    
    var filteringNewlines: Str? {
        filtering(allowed: CS.newlines)
    }
    
    var filteringWhitespacesAndNewlines: Str? {
        filtering(allowed: CS.whitespacesAndNewlines)
    }
    
    //    func rng(of str: Str,
    //                  caseSensitive: Bool = true) -> Bool {
    //        if !caseSensitive {
    //            return rng(of: str, options: .caseInsensitive) != nil
    //        }
    //        return rng(of: str) != nil
    //    }
    
    
    //MARK: - filters + rng
    
    func filtering(allowed charSet: CS,
                   in rng: Rng) -> Str? {
        L.notImpl()
        
        // components(separatedBy: charSet.inverted).sth?.joined()
    }
    func filtering(disallowed charSet: CS,
                   in rng: Rng) -> ICSet? {
        L.notImpl()
        
        // components(separatedBy: charSet).sth?.joined()
    }
    
    func filteringDecimalDigits(in rng: Rng) -> Str? {
        L.notImpl()
        
        // filtering(allowed: CS.decimalDigits)
    }
    
    func filteringAlphanumerics(in rng: Rng) -> Str? {
        L.notImpl()
        
        // filtering(allowed: CS.alphanumerics)
    }
    
    func filteringPunctuationChars(in rng: Rng) -> Str? {
        L.notImpl()
        
        // filtering(allowed: CS.punctuationCharacters)
    }
    
    func filteringLetters(in rng: Rng) -> Str? {
        L.notImpl()
        
        // filtering(allowed: CS.letters)
    }
    
    func filteringLowercaseLetters(in rng: Rng) -> Str? {
        L.notImpl()
        
        // filtering(allowed: CS.lowercaseLetters)
    }
    
    func filteringUppercaseLetters(in rng: Rng) -> Str? {
        L.notImpl()
        
        // filtering(allowed: CS.uppercaseLetters)
    }
    
    func filteringSymbols(in rng: Rng) -> Str? {
        L.notImpl()
        
        // filtering(allowed: CS.symbols)
    }
    
    func filteringWhitespaces(in rng: Rng) -> Str? {
        L.notImpl()
        
        // filtering(allowed: CS.whitespaces)
    }
    
    func filteringNewlines(in rng: Rng) -> Str? {
        L.notImpl()
        
        // filtering(allowed: CS.newlines)
    }
    
    func filteringWhitespacesAndNewlines(in rng: Rng) -> Str? {
        L.notImpl()
        
        // filtering(allowed: CS.whitespacesAndNewlines)
    }
    
    //    func rng(of str: ICSet,
    //                  caseSensitive: Bool = true) -> Bool {
    //        if !caseSensitive {
    //            return rng(of: str, options: .caseInsensitive) != nil
    //        }
    //        return rng(of: str) != nil
    //    }
    
    
    //MARK:
    
    //    /// caseSensitive! TODO: caseInSensitive
    //    var hasEngLetters: Bool {
    //         has(chars: CS.engLetters,false)
    //    }
    //    /// caseSensitive! TODO: caseInSensitive
    //    var hasOnlyEngLetters: Bool {
    //         hasOnly(chars: CS.engLetters,false)
    //    }
    //
    //    /// caseSensitive! TODO: caseInSensitive
    //    var hasAlphaNumerics: Bool {
    //         has(CS.alphanumerics,false)
    //    }
    //    /// caseSensitive! TODO: caseInSensitive
    //    var hasOnlyAlphaNumeric: Bool {
    //         hasOnly(CS.alphanumerics,false)
    //    }
    //
    //    var hasOnlyDigits: Bool {
    //         hasOnly(CS.decimalDigits,false)
    //    }
    //
    //    ///  Check if the given string has only white spaces
    //    var hasOnlySpacesAndNewlines: Bool {
    //         hasOnly(CS.whitespacesAndNewlines,false)
    //        // trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    //    }
    
    //    var hasUppercasedCharacters: Bool {
    //         has(CS.uppercaseLetters,false)
    //    }
    //    var hasLowercasedCharacters: Bool {
    //         has(CS.lowercaseLetters,false)
    //    }
    
    //    var hasOnlyUppercasedCharacters: Bool {
    //         hasOnly(CS.uppercaseLetters,false)
    //    }
    //    var hasOnlyLowercasedCharacters: Bool {
    //         hasOnly(CS.lowercaseLetters, false)
    //    }
    //
    //
    //    var isDigit: Bool {
    //         hasOnlyDigits
    //    }
    //
    //    var hasDigits: Bool {
    //         has(CS.digits, false)
    //    }
    //any numbers ??
    //    var hasNumbers: Bool {
    //         has(CS.decimalDigits)
    //    }
    
    
    //MARK: - rng
    
    /// caseSensitive! TODO: caseInSensitive
    //    func hasEngLetters(in rng: Rng) -> Bool {
    //
    //        L.notImpl()
    //
    //        // has(chars: CS.engLetters,false)
    //    }
    //
    //    /// caseSensitive! TODO: caseInSensitive
    //    func hasOnlyEngLetters(in rng: Rng) -> Bool {
    //        L.notImpl()
    //
    //        // hasOnly(chars: CS.engLetters,false)
    //    }
    //
    //    /// caseSensitive! TODO: caseInSensitive
    //    func hasAlphaNumerics(in rng: Rng) -> Bool {
    //
    //        L.notImpl()
    //
    //        // has(CS.alphanumerics,false)
    //    }
    //    /// caseSensitive! TODO: caseInSensitive
    //    func hasOnlyAlphaNumeric(in rng: Rng) -> Bool {
    //        L.notImpl()
    //
    //        // hasOnly(CS.alphanumerics,false)
    //    }
    //
    //    func hasOnlyDigits(in rng: Rng) -> Bool {
    //
    //        L.notImpl()
    //
    //        // hasOnly(CS.decimalDigits,false)
    //    }
    //
    //    ///  Check if the given string has only white spaces
    //    func hasOnlySpacesAndNewlines(in rng: Rng) -> Bool {
    //
    //        L.notImpl()
    //
    //        // hasOnly(CS.whitespacesAndNewlines,false)
    //    }
    //
    //    func hasUppercasedCharacters(in rng: Rng) -> Bool {
    //
    //        L.notImpl()
    //
    //        // has(CS.uppercaseLetters,false)
    //    }
    //
    //    func hasLowercasedCharacters(in rng: Rng) -> Bool {
    //
    //        L.notImpl()
    //
    //        // has(CS.lowercaseLetters,false)
    //    }
    //
    //    func hasOnlyUppercasedCharacters(in rng: Rng) -> Bool {
    //
    //        L.notImpl()
    //
    //        // hasOnly(CS.uppercaseLetters,false)
    //    }
    //
    //    func hasOnlyLowercasedCharacters(in rng: Rng) -> Bool {
    //
    //        L.notImpl()
    //
    //        // hasOnly(CS.lowercaseLetters, false)
    //    }
    //
    //
    //    func hasDigits(in rng: Rng) -> Bool {
    //
    //        L.notImpl()
    //
    //        // has(CS.digits, false)
    //    }
    
    
    /// any case
    //    static func endsWithEngLetter(_ str: Str,
    //                                  _ caseSensitive: Bool = true) -> Bool {
    //        guard let char = str.last?.s.lowercased else {
    //            return false
    //        }
    //        return CS.engLetters.has(char, caseSensitive)
    //    }
    
    /// any case
    static func startsWithEngLetter(_ str: Str) -> Bool {
        guard let char1 = str.char1?.lowercased() else {
            return false
        }
        return CS.engLetters.has(char1)
    }
    
    /// any case
    var startsWithEngLetter: Bool {
        Str.startsWithEngLetter(self)
    }
    /// any case
    //    var endsWithEngLetter: Bool {
    //         Str.endsWithEngLetter(self)
    //    }
    
    //MARK: -
    
    ///  Check if string contains only unique chars.
    var hasUniqueChars: Bool {
        //TODO: improve, try use Set or allSatisfy
        
        L.notImpl()
        //        guard hasSth else { return false }
        //        var all = Set<Str>()
        //        for char in self {
        //            if all.contains(char.s) {
        //                return false
        //            }
        //            all.insert(char.s)
        //        }
        //        return true
    }
    
    ///  Check if string contains only unique chars.
    func hasUniqueChars(in rng: Rng) -> Bool {
        
        L.notImpl()
        //TODO: improve, try use Set or allSatisfy
        
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
    var upperCamelCased: Str {
        capitalized.components(separatedBy: .whitespacesAndNewlines).joined()
    }
}


