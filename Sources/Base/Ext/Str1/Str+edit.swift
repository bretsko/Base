

public extension Str {
    
    // try improve
    
    /// trims given suffix and prefix, or returns nil if any is not found
    /// if trimAnySpacesAndNewLines is true - any Strings between words are trimmed
    /// if allowMissing is true - either suffix or prefix may be missing, but not all
    func unwrap(suffix: Str,
                prefix: Str,
                trimAnySpacesAndNewLines: Bool = true,
                allowMissing: Bool = false) -> Str? {
        
        guard !allowMissing else {
            L.notImpl()
        }
        
        var r = self
        if trimAnySpacesAndNewLines {
            r = r.trimmingSpacesAndNewlines
        }
        
        guard let str1 = r.removing(suffix: suffix) else {
            return nil
        }
        r = str1
        if trimAnySpacesAndNewLines {
            r = r.trimmingSpacesAndNewlines
        }
        
        guard let str2 = r.removing(prefix: prefix) else {
            return nil
        }
        r = str2
        if trimAnySpacesAndNewLines {
            r = r.trimmingSpacesAndNewlines
        }
        return r
    }
    
    /// trims given suffixes and prefixes from the string, or returns nil if any is not found
    /// maxSeparation - max num spaces which can be between suffixes, prefixes and string, usually 2-3
    /// if allowMissing is true - some suffixes, prefixes may be missing, but not all
    func unwrap(suffixes: [Str],
                prefixes: [Str],
                maxSeparation: Int = 3,
                allowMissing: Bool = false) -> Str? {
        
        guard !allowMissing else {
            L.notImpl()
        }
        
        //TODO: make func to make all combinations of 2 Strings with diff separation
        // need double for loop - to try all permutations -> try find func to make all permuations, or impl it
        
        for numSpaces1 in 1...maxSeparation {
            
            let separ1 = Str(repeating: " ", count: numSpaces1)
            let suffixStr = suffixes.joined(separator: separ1)
            
            for numSpaces2 in 1...maxSeparation {
                
                let separ2 = Str(repeating: " ", count: numSpaces2)
                let prefixStr = suffixes.joined(separator: separ2)
                
                if let str = unwrap(suffix: suffixStr,
                                    prefix: prefixStr,
                                    allowMissing: allowMissing) {
                    return str
                }
            }
        }
        return nil
    }
    
    /// Collects all possible variants of given string, trimmed from the suffixes and prefixes, or returns nil if any is not found
    /// maxSeparation - max num spaces which can be between suffixes, prefixes and string, usually 2-3
    /// if allowMissing is true - some suffixes, prefixes may be missing, but not all
    func unwrapAllVariants(suffixes: [Str],
                prefixes: [Str],
                maxSeparation: Int = 3,
                allowMissing: Bool = false) -> Set<Str>? {
        
        guard !allowMissing else {
            L.notImpl()
        }
        
        //TODO: make func to make all combinations of 2 Strings with diff separation
        // need double for loop - to try all permutations -> try find func to make all permuations, or impl it
        
        var all = Set<Str>()
        for numSpaces1 in 1...maxSeparation {
            
            let separ1 = Str(repeating: " ", count: numSpaces1)
            let suffixStr = suffixes.joined(separator: separ1)
            
            for numSpaces2 in 1...maxSeparation {
                
                let separ2 = Str(repeating: " ", count: numSpaces2)
                let prefixStr = suffixes.joined(separator: separ2)
                
                if let str = unwrap(suffix: suffixStr,
                                    prefix: prefixStr,
                                    allowMissing: allowMissing) {
                    all.insert(str)
                }
            }
        }
        return all.sth
    }
    
    //TODO: add func with array of allowed elements
    
    
    //MARK: -
    
    /// Returns part of the String before the first occurrence of str
    /// if it's not found - returns self
    /// components(separatedBy: str)[0]
    func firstPrefix(before str: Str) -> Str {
        components(separatedBy: str)[0]
    }
    
    /// Returns part of the String after the last occurrence of str
    /// if it's not found - returns self
    /// components(separatedBy: str).last ?? self
    func lastSuffix(after str: Str) -> Str {
        components(separatedBy: str).last ?? self
    }
    
    
    //MARK: -
    
    @discardableResult
    mutating func removeAll<T: StringProtocol>(of str: T) -> Bool {
        let oldLen = len
        let a = replacingOccurrences(of: str, with: "")
        if oldLen != len {
            self = a
            return true
        }
        return false
    }
    
    func removingAll<T: StringProtocol>(of str: T) -> Str {
        replacingOccurrences(of: str, with: "")
    }
    
    @discardableResult
    mutating func removeSpaces() -> Bool {
        removeAll(of: " ")
    }
    var removingSpaces: Str? {
        removingAll(of: " ")
    }
    
    @discardableResult
    mutating func removeNewLines() -> Bool {
        removeAll(of: "\n")
    }
    var removingNewLines: Str? {
        removingAll(of: "\n")
    }
    
    /// returns false if any fails, but false doesnt mean nothing changed!!
    @discardableResult
    mutating func removeSpacesAndNewLines() -> Bool {
        removeSpaces() && removeNewLines()
    }
    var removingSpacesAndNewLines: Str? {
        removingSpaces?.removingNewLines
    }
    
    
    //    @discardableResult
    //    mutating func removeSpaces() -> Bool {
    //         removeAll(of: " ")
    //    }
    //    var removingSpaces: Str? {
    //         removingAll(of: " ")
    //    }
    //
    //    @discardableResult
    //    mutating func removeNewLines() -> Bool {
    //         removeAll(of: "\n")
    //    }
    //    var removingNewLines: Str? {
    //         removingAll(of: "\n")
    //    }
    //
    //    /// returns false if any fails, but false doesnt mean nothing changed!!
    //    @discardableResult
    //    mutating func removeSpacesAndNewLines() -> Bool {
    //         removeSpaces() && removeNewLines()
    //    }
    //    var removingSpacesAndNewLines: Str? {
    //         removingSpaces?.removingNewLines
    //    }
    //
    //?
    //    mutating func removeCharrs(strings: [Str]) {
    //        strings.forEach {
    //            while true {
    //                if let rng = rng(of: $0) {
    //                    removeSubrange(rng)
    //                } else { break }
    //            }
    //        }
    //    }
    
    
    //MARK: -
    
    /// if no such prefix - returns nil
    func removing(prefix: Str) -> Str? {
        guard hasPrefix(prefix) else {
            return nil
        }
        if let a = dropFirst(prefix.len).sth {
            return Str(a)
        }
        return nil
    }
    
    /// if no such suffix - returns nil
    func removing(suffix: Str) -> Str? {
        guard hasSuffix(suffix) else {
            return nil
        }
        if let a = dropLast(suffix.len).sth {
            return Str(a)
        }
        return nil
    }
    
    
    //MARK: -
    
    /// if no such prefix - no effect
    @discardableResult
    mutating func remove(prefix: Str) -> Bool {
        if let a = removing(prefix:prefix) {
            self = a
            return true
        }
        return false
    }
    
    /// if no such suffix - no effect
    @discardableResult
    mutating func remove(suffix: Str) -> Bool {
        if let a = removing(suffix:suffix) {
            self = a
            return true
        }
        return false
    }
    
    
    //MARK: - remove first, last
    
    var removingLast: Str? {
        if let a = dropLast().sth {
            return Str(a)
        }
        return nil
    }
    
    /// if num > str length - returns the same string
    func removingLast(_ num: Int) -> Str? {
        guard len >= num else {
            return nil
        }
        if let a = dropLast(num).sth {
            return Str(a)
        }
        return nil
    }
    
    var removingFirst: Str? {
        if let a = dropFirst().sth {
            return Str(a)
        }
        return nil
    }
    
    /// if num > str length - returns the same string
    func removingFirst(_ num: Int) -> Str? {
        guard len >= num else {
            return nil
        }
        if let a = dropFirst(num).sth {
            return Str(a)
        }
        return nil
    }
    
    /// if num > str length - no effect
    @discardableResult
    mutating func removeLast(_ num: Int) -> Bool {
        if let a = removingLast(num) {
            self = a
            return true
        }
        return false
    }
    
    /// if num > str length - no effect
    @discardableResult
    mutating func removeFirst(_ num: Int) -> Bool {
        if let a = removingFirst(num) {
            self = a
            return true
        }
        return false
    }
    
    @discardableResult
    mutating func removeLast() -> Bool {
        if let a = removingLast {
            self = a
            return true
        }
        return false
    }
    
    @discardableResult
    mutating func removeFirst() -> Bool {
        if let a = removingFirst {
            self = a
            return true
        }
        return false
    }
    
    
    //MARK: - remove 2
    
    /// if no such suffix - returns nil
    @discardableResult
    func removing(suffix: Str,
                  adding suffix2: Str) -> Str? {
        
        guard hasSuffix(suffix) else {
            return nil
        }
        var s = self
        s.remove(suffix: suffix)
        return s + suffix2
    }
    
    /// if no such prefix1 - returns nil
    @discardableResult
    func removing(prefix: Str,
                  adding prefix2: Str) -> Str? {
        guard hasPrefix(prefix) else {
            return nil
        }
        var s = self
        s.remove(prefix: prefix)
        return prefix2 + s
    }
    
    
    /// if no such suffix - no effect
    @discardableResult
    mutating func remove(suffix: Str,
                         add suffix2: Str) -> Bool {
        guard hasSuffix(suffix) else {
            return false
        }
        removeLast(suffix.len)
        self += suffix2
        return true
    }
    
    /// if no such prefix - no effect
    @discardableResult
    mutating func remove(prefix: Str,
                         add prefix2: Str) -> Bool {
        guard hasPrefix(prefix) else {
            return false
        }
        removeFirst(prefix.len)
        self = prefix2 + self
        return true
    }
    
}



//TODO: ??

//    @discardableResult
//    mutating func removeAll<T: StringProtocol>(of str: T) -> Bool {
//        let oldLen = len
//        let a = replacingOccurrences(of: str, with: "")
//        if oldLen != len {
//            self = a
//            return true
//        }
//        return false
//    }
//    func removingAll<T: StringProtocol>(of str: T) -> Str {
//        return replacingOccurrences(of: str, with: "")
//    }


//    func removing(prefix: Str) -> Str {
//        guard let rng = rng(of: prefix) else {
//            return self
//        }
//        if rng.upperBound >= endIndex {
//            return Str(self[startIndex..<rng.lowerBound])
//        }
//        return Str(self[rng.upperBound..<endIndex])
//    }
//
//    func removing(suffix: Str) -> Str {
//        guard let rng = rng(of: suffix,
//                              options: .backwards) else {
//            return self
//        }
//        if rng.upperBound >= endIndex {
//            return Str(self[startIndex..<rng.lowerBound])
//        }
//        return Str(self[rng.upperBound..<endIndex])
//    }

//public extension Str.SubSequence {
//
//    mutating func removeChars(strings: [Str]) {
//        strings.forEach {
//            while true {
//                if let rng = rng(of: $0) {
//                    removeSubrange(rng)
//                } else { break }
//            }
//        }
//    }
//}

