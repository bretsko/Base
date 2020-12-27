

public extension Str {
    
    /// only returns array of non-empty strings
    func split(by charSet: CS) -> [Str]? {
        components(separatedBy: charSet).sth
    }
    /// only returns array of non-empty strings
    func splitBy(charSet: Str) -> [Str]? {
        split(by: charSet.cs)
    }
    
    /// components(separatedBy: str)
    func split(by str: Str) -> [Str]? {
        components(separatedBy: str).sth
    }
    
    //MARK: - substr
    
    func substring(from index: Int) -> Str {
        Str(self[self.index(self.startIndex, offsetBy: index)...])
    }
    
    func substring(to index: Int) -> Str {
        Str(prefix(index))
    }
}


/// animals - imals - 2 = len - 2
/// Returns a new string containing the chars of the Str from the one at a given idx, including it, to the end.
//    func substr(from idx: Int,
//                includingIt: Bool = false) -> Str? {
//        guard hasSth, idx + 1 <= len else {
//            return nil
//        }
//        return Str(suffix(len - idx + 1))
//        //return substr(from: self.index(startIndex, offsetBy: idx))
//    }
//
//    /// Returns a new string containing the chars of the Str up to and including, the one at a given idx.
//    func substr(to idx: Int,
//                includingIt: Bool = false) -> Str? {
//        guard contains(index:idx) else {
//            return nil
//        }
//        return Str(prefix(len - idx))
//        // var i = max(0, min(idx, len - 1))
//        // return substr(to: index(startIndex, offsetBy: i))
//    }
//
//    //MARK: -
//
//    func substr(from char: Char,
//                includingIt: Bool = false) -> Str? {
//        guard let i = firstIndex(of: char) else {
//            return nil
//        }
//        return substr(from: i, includingIt: includingIt)
//    }
//
//    func substr(to char: Char,
//                includingIt: Bool = false) -> Str? {
//        guard let i = firstIndex(of: char) else {
//            return nil
//        }
//        return substr(to: i, includingIt: includingIt)
//    }
//
//
//    //MARK: -
//
//    func substr(with rng: CountableClosedRange<Int>) -> Str {
//         substr(with: Range(uncheckedBounds: (lower: rng.lowerBound, upper: rng.upperBound + 1)))
//    }
//
//    func substr(with rng: Range<Int>) -> Str {
//        //        let start = index(startIndex, offsetBy: rng.lowerBound)
//        //        let end = index(startIndex, offsetBy: min(chars.len - 1, rng.upperBound))
//
//        fatalError()
//        //return self[start ..< end]
//    }
//
//
//    /// animals - imals - 2 = len - 2
//    /// Returns a new string containing the chars of the Str from the one at a given idx, including it, to the end.
//    func substr(from idx: StrIdx,
//                includingIt: Bool = false) -> Str? {
//
//        fatalError()
//        //        guard contains(index:idx) else {
//        //            return nil
//        //        }
//        //        return Str(suffix(len - idx + 1))
//        //return substr(from: self.index(startIndex, offsetBy: idx))
//    }
//
//    /// Returns a new string containing the chars of the Str up to and including, the one at a given idx.
//    func substr(to idx: StrIdx,
//                includingIt: Bool = false) -> Str? {
//
//        fatalError()
//        //        guard contains(index:idx) else {
//        //            return nil
//        //        }
//        //        return Str(prefix(len - idx))
//        // var i = max(0, min(idx, len - 1))
//        // return substr(to: index(startIndex, offsetBy: i))
//    }
//
//    //MARK: -
//
/// returns at least self in array!
/// only returns array of non-empty strings
//    func split_(by charSet: CS) -> [Str] {
//        if let a = split(by:charSet) {
//            return a
//        }
//        return [self]
//    }

/// returns nil if doesnt contain given str
/// only returns array of non-empty strings
//    func split(by str: Str,
//               _ caseSensitive: Bool = true) -> [Str]? {
//        guard has(str, caseSensitive: caseSensitive) else {
//            return nil
//        }
//        fatalError()
//        //return
//    }


/// returns at least self in array!
/// only returns array of non-empty strings
//    func splitBy_(chars: Str) -> [Str] {
//        if let a = split(by: chars) {
//            return a
//        }
//        return [self]
//    }

/// returns at least self in array!
/// only returns array of non-empty strings
//    func split_(by str: Str,
//                _ caseSensitive: Bool = true) -> [Str] {
//        if let a = split(by:str, caseSensitive) {
//            return a
//        }
//        return [self]
//    }


//        func split(by charSet: CharacterSet) -> Array<Str> {
//            let scalars = self.unicodeScalars
//            var final = Array<Str>()
//
//            var current: Str?
//            for scalar in scalars {
//                let isSplit = characterSet.contains(scalar)
//                switch (isSplit, current) {
//
//                case (true, nil):
//                    current = Str(scalar)
//                case (true, .some(let c)):
//                    final.append(c)
//                    current = Str(scalar)
//
//                case (false, nil):
//                    current = Str(scalar)
//                case (false, .some(_)):
//                    current?.append(Str(scalar))
//                }
//            }
//
//            if let c = current {
//                final.append(c)
//            }
//
//            return final
//        }
//


/// returns nil if doesnt contain any of strings
//    func split(by strs: [Str],
//                 _ caseSensitive: Bool = true) -> [Str]? {
//
//        //TODO: divided several times or once ??
//        // for ex
//        // "cat. is, small".divided(by: [",", "."])
//        // can produce
//        // 1 - ["cat", "is", "small"]
//        // 2 - ["cat", "cat, is small"] OR ["cat. is", "small"]
//
//
//        fatalError()
//        guard has(strs, caseSensitive) else {
//            return nil
//        }
//        return strs.reduce([Str], { arr, str in
//            if let a = divided(by:str, caseSensitive) {
//                return arr + a
//            }
//            return arr
//            //components(separatedBy: str.charSet).sth
//        }).sth
//    }


//
//    /// returns false if doesnt contain given charSet
//    @discardableResult
//    mutating func split(by charSet: CS) -> Bool {
//        if let a = split(by:charSet) {
//            self = a
//            return true
//        }
//        return false
//    }
//
//    /// returns false if doesnt contain given chars
//    @discardableResult
//    mutating func split(chars: Str) -> Bool {
//        if let a = divided(by:chars) {
//            self = a
//            return true
//        }
//        return false
//    }
//
//    /// returns false if doesnt contain given str
//    @discardableResult
//    mutating func split(by str: Str,
//                 _ caseSensitive: Bool = true) -> Bool {
//        if let a = divided(by:str, caseSensitive) {
//            self = a
//            return true
//        }
//        return false
//    }
//


