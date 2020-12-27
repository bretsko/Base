//
//
//
//public extension Str {
//    
//    func has(_ str: Str,
//             in rng: Rng,
//             _ caseSensitive: Bool = true) -> Bool {
//        
//        L.notImpl()
//        //return s.
//        
//        //        if caseSensitive {
//        //            return contains(str)
//        //        } else {
//        //            return lowercased.contains(str.lowercased)
//        //        }
//    }
//    
//    /// returns false if doesnt contain any of strings
//    func hasSome(_ rtrs: [Str],
//                 in rng: Rng,
//                 _ caseSensitive: Bool = true) -> Bool {
//        L.notImpl()
//        //return s.
//        
//        //return strs.has{ has($0) }
//    }
//    func hasAll(_ strs: [Str],
//                in rng: Rng,
//                _ caseSensitive: Bool = true) -> Bool {
//        L.notImpl()
//        //return s.
//        
//        //return strs.allSatisfy{ has($0) }
//    }
//    
//    
//    func has(_ charSet: CS,
//             in rng: Rng,
//             _ caseSensitive: Bool = true) -> Bool {
//        
//        L.notImpl()
//        //return s.
//        
//        //        if caseSensitive {
//        //            return self.charSet.isSuperset(of: charSet)
//        //
//        //        } else {
//        //            //use ? CS.uppercaseLetters
//        //            L.notImpl()
//        //        }
//    }
//    
//    func hasOnly(_ charSet: CS,
//                 in rng: Rng,
//                 _ caseSensitive: Bool = true) -> Bool {
//        L.notImpl()
//        //return s.
//        
//        //return !has(charSet.inverted, caseSensitive)
//    }
//    
//    /// compares charSets
//    func has(chars: Str,
//             in rng: Rng,
//             _ caseSensitive: Bool = true) -> Bool {
//        L.notImpl()
//        //return s.
//        
//        //return has(chars.charSet, caseSensitive)
//    }
//    
//    /// compares charSets
//    func hasOnly(chars: Str,
//                 in rng: Rng,
//                 _ caseSensitive: Bool = true) -> Bool {
//        
//        L.notImpl()
//        //return s.
//        
//        //return hasOnly(chars.charSet, caseSensitive)
//    }
//    
//    
//    //MARK: suffix, prefix
//    
//    func has(suffix: Str,
//             _ caseSensitive: Bool = true) -> Bool {
//        if caseSensitive {
//            return hasSuffix(suffix)
//        }
//        return lowercased.hasSuffix(suffix.lowercased)
//    }
//    func has(prefix: Str,
//             _ caseSensitive: Bool = true) -> Bool {
//        if caseSensitive {
//            return hasPrefix(prefix)
//        }
//        return lowercased.hasPrefix(prefix.lowercased)
//    }
//    
//    //MARK: count
//    
//    func count(of str: Str,
//               _ caseSensitive: Bool = true) -> Int {
//        if !caseSensitive {
//            return lowercased.components(separatedBy: str.lowercased).len - 1
//        }
//        return components(separatedBy: str).len - 1
//    }
//    
//    func count(of str: Str,
//               in rng: Rng,
//               _ caseSensitive: Bool = true) -> Int {
//        
//        L.notImpl()
//        
//        //        if !caseSensitive {
//        //            return lowercased.components(separatedBy: str.lowercased).len - 1
//        //        }
//        //        return components(separatedBy: str).len - 1
//    }
//    
//    //MARK:
//    
//    
//    func mostCommonChar(in rng: Rng) -> Char? {
//        L.notImpl()
//        
//        // return removingSpacesAndNewLines?.reduce(into: [Char: Int]()) {
//        //            let len = $0[$1] ?? 0
//        //            $0[$1] = len + 1
//        //            }.max { $0.1 < $1.1 }?.0
//    }
//}
