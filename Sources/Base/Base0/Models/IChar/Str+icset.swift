

public extension Str {
    
    var icset: ICSet {
         ICSet(self)
    }
    
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
        //        } else {
        //            if caseSensitive {
        //                return replacingAll(of: substr, with: newString)
        //            } else if let rng = range(of: substr) {
        //                L.notImpl()
        //                //return replacingAll(of: substr, with: newString)
        //            }
        //            L.notImpl()
        //        }
    }
    
    
    /// filters all punctuation and lowercases
    var preprocessed_icset: ICSet {
        .init(preprocessed)
    }
    
    /// takes 1st char!
    //    var char1_icset: ICSet? {
    //        if let c = char1 {
    //            return ICSet(0, c)
    //        }
    //        return nil
    //    }
    
    
    /// newline separated string
    var lines_icset: [ICSet]? {
         divided_icset(by: CS.newlines)
    }
    
    /// lines with trimmed spaces
    var nonEmptyLines_icset: [ICSet]? {
        L.notImpl()
        // lines?. filter{ $0.trimmingSpaces.hasSth }.sth
    }
    
    var words_icset: [ICSet]? {
         divided_icset(by: CS.whitespacesAndNewlines)
    }
    
    
    func findAll(_ icset: ICSet,
                 caseSensitive: Bool = true) -> [ICSet]? {
        
        L.notImpl()
        //return s.
        
        //        var s = str
        //        if !caseSensitive {
        //            s = s.lowercased
        //        }
        //        return lowercased.divided(by: s).sth
    }
    
    //TODO:
    //    func occurrences(of icset: ICSet,
    //                     caseSensitive: Bool = true) -> [IStr]? {
    //        var s = str
    //        if !caseSensitive {
    //            s = s.lowercased
    //        }
    //        return lowercased.divided(by: s).sth
    //    }
    
    //MARK: has
    
    func has(_ icset: ICSet,
             _ caseSensitive: Bool = true) -> Bool {
        
        L.notImpl()
        //return s.
        
        //        if caseSensitive {
        //            return contains(str)
        //        } else {
        //            return lowercased.contains(str.lowercased)
        //        }
    }
    
    /// returns false if doesnt contain any of strings
    func has(some srtrs: [ICSet],
             _ caseSensitive: Bool = true) -> Bool {
        L.notImpl()
        //return s.
        
        //return strs.has{ has($0) }
    }
    func has(all icsets: [ICSet],
             _ caseSensitive: Bool = true) -> Bool {
        L.notImpl()
        //return s.
        
        //return strs.allSatisfy{ has($0) }
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
    
    
    //any numbers ??
    //    var hasNumbers: Bool {
    //        return has(CS.decimalDigits)
    //    }
    
    
    //MARK: remove
    
    /// if no prefix - returns nil
    func removing_icset(prefix: Str) -> ICSet? {
        
        L.notImpl()
        //return s.
        
        //        guard hasPrefix(prefix) else {
        //            return nil
        //        }
        //        let a = removeFirst(prefix.len)
        //        return a.isEmpty ? nil : ICSet(a)
    }
    
    /// if no suffix - returns nil
    func removing_icset(suffix: Str) -> ICSet? {
        
        L.notImpl()
        //return s.
        
        //        guard hasSuffix(suffix) else {
        //            return nil
        //        }
        //        let a = removeLast(suffix.len)
        //        return a.isEmpty ? nil : ICSet(a)
    }
    
    
    //MARK: mutating
    
    
    //MARK: remove first, last
    
    var removingLast_icset: ICSet? {
        
        L.notImpl()
        //return s.
        
        //        let a = removeLast()
        //        return a.isEmpty ? nil : ICSet(a)
    }
    
    /// if num > str length - returns the same string
    func removingLast_icset(_ num: Int) -> ICSet? {
        
        L.notImpl()
        //return s.
        
        //        guard len >= num else {
        //            return nil
        //        }
        //        let a = removeLast(num)
        //        return a.isEmpty ? nil : ICSet(a)
    }
    
    var removingFirst_icset: ICSet? {
        
        L.notImpl()
        //return s.
        
        //        let a = removeFirst()
        //        return a.isEmpty ? nil : ICSet(a)
    }
    
    /// if num > str length - returns the same string
    func removingFirst_icset(_ num: Int) -> ICSet? {
        
        L.notImpl()
        //return s.
        
        //        guard len >= num else {
        //            return nil
        //        }
        //        let a = removeFirst(num)
        //        return a.isEmpty ? nil : ICSet(a)
    }
    
    //MARK: -
    
    var trimmingSpaces_icset: ICSet {
        L.notImpl()
        //return s.
        
        //return trimmingCharacters(in: .whitespaces)
    }
    var trimmingSpacesAndNewlines_icset: ICSet {
        L.notImpl()
        //return s.
        
        //return trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    
    //MARK: divided
    
    func divided_icset(by charSet: CS) -> [ICSet]? {
        L.notImpl()
        //return s.
        
        //return divided(by: charSet).sth
    }
    func dividedBy_icset(chars: Str) -> [ICSet]? {
        L.notImpl()
        //return s.
        
        //return divided(by: chars.charSet)
    }
    
    /// returns nil if doesnt contain given str
    func divided_icset(by str: Str,
                       _ caseSensitive: Bool = true) -> [ICSet]? {
        
        L.notImpl()
        //return s.
        
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
    ////            //divided(by: str.charSet).sth
    ////        }).sth
    //    }
    
    
    //MARK: removing
    
    @discardableResult
    mutating func removeAll_icset<T: StringProtocol>(of str: T) -> Bool {
        L.notImpl()
        //return s.
        
        
        //        let oldLen = len
        //        let a = replacingAll(of: str, with: "")
        //        if oldLen != len {
        //            self = a
        //            return true
        //        }
        //        return false
    }
    func removingAll_icset<T: StringProtocol>(of str: T) -> ICSet {
        L.notImpl()
        //return s.
        
        //return replacingAll(of: str, with: "")
    }
    
    var removingSpaces_icset: ICSet? {
        L.notImpl()
        //return s.
        
        //return removingAll(of: " ")
    }
    
    
    var removingNewLines_icset: ICSet? {
        L.notImpl()
        //return s.
        
        //return removingAll(of: "\n")
    }
    
    
    var removingSpacesAndNewLines_icset: ICSet? {
        
        L.notImpl()
        //return s.
        
        //return removingSpaces?.removingNewLines
    }
    
    ///  an array of all words in a string
    /// "Swift is amazing".words() -> ["Swift", "is", "amazing"]
    /// - Returns: The words contained in a string.
    var wordsSeparatedByCommas_icset: [ICSet]? {
        
        L.notImpl()
        //return s.
        
        
        //        let a = CS.whitespacesAndNewlines.union(.punctuationCharacters)
        //        return divided(by: a). filter{!$0.isEmpty}.sth
    }
    
    // Array of strs separated by given string.
    func splited_icset(by separator: Char) -> [ICSet]? {
        
        L.notImpl()
        //return s.
        
        //return split { $0 == separator }.map(ICSet.init).sth
    }
    
    
    func substr_icset(with range: Range<Int>) -> ICSet {
        
        L.notImpl()
        //return s.
        
        //        let start = index(startIndex, offsetBy: range.lowerBound)
        //        let end = index(startIndex, offsetBy: Swift.min(chars.len - 1, range.upperBound))
        //
        //        return substr(with: start ..< end)
    }
    
    
    /// animals - imals - 2 = len - 2
    /// Returns a new string containing the chars of the ICSet from the one at a given idx, including it, to the end.
    func substr_icset(from idx: Int) -> ICSet? {
        
        L.notImpl()
        //return s.
        
        //        guard hasSth, idx + 1 <= len else {
        //            return nil
        //        }
        //        return ICSet(suffix(len - idx + 1))
        
        //return substr(from: self.index(startIndex, offsetBy: idx))
    }
    
    /// Returns a new string containing the chars of the ICSet up to and including, the one at a given idx.
    func substr_icset(to idx: Int) -> ICSet? {
        
        L.notImpl()
        //return s.
        
        //        guard hasSth, idx + 1 <= len else {
        //            return nil
        //        }
        //        return ICSet(prefix(len - idx))
        
        // var i = max(0, min(idx, len - 1))
        // return substr(to: index(startIndex, offsetBy: i))
    }
    
    func substr_icset(from char: Char) -> ICSet? {
        
        L.notImpl()
        //return s.
        
        //        guard let i = firstIndex(of: char)  else {
        //            return nil
        //        }
        //        return substr(from: i)
    }
    
    
    func substr_icset(to char: Char) -> ICSet? {
        
        L.notImpl()
        //return s.
        
        //        guard let i = index(of: char) else {
        //            return nil
        //        }
        //        return substr(to: i)
    }
    
    func substr_icset(with range: CountableClosedRange<Int>) -> ICSet {
        
        L.notImpl()
        //return s.
        
        //return substr(with: Range(uncheckedBounds: (lower: range.lowerBound, upper: range.upperBound + 1)))
    }
    
    
    
    
    //MARK: remove 2
    
    /// if no suffix - returns nil
    func removing_icset(suffix: Str,
                        adding suffix2: Str) -> ICSet? {
        
        L.notImpl()
        //return s.
        
        //        guard hasSuffix(suffix) else {
        //            return nil
        //        }
        //        var s = self
        //        s.remove(suffix: suffix)
        //        return s + suffix2
    }
    
    /// if no prefix1 - returns nil
    func removing_icset(prefix: Str,
                        adding prefix2: Str) -> ICSet? {
        
        L.notImpl()
        //return s.
        
        //        guard hasPrefix(prefix) else {
        //            return nil
        //        }
        //        var s = self
        //        s.remove(prefix: prefix)
        //        return prefix2 + s
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


