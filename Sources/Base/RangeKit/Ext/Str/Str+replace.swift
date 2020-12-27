//
//
//
//public extension Str {
//
//    /// if doesnt contain - returns nil
//    func replacing(_ substr: Str,
//                   with newString: Str,
//                   _ caseSensitive: Bool = true,
//                   in rng: Rng? = nil) -> Str? {
//        
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
//                
//                L.notImpl()
//                //                if let foundRng = rng(of: substr, options: .caseInsensitive) { //, rng: r
//                //                    return replacingCharacters(in: foundRng, with: newString)
//                //                } else {
//                //                    return nil
//                //                }
//            }
//            
//        } else {
//            
//            if caseSensitive {
//                return replacingOccurrences(of: substr, with: newString)
//                
//            } else if let rng = rng(of: substr) {
//                
//                L.notImpl()
//                //return replacingAll(of: substr, with: newString)
//            }
//            L.notImpl()
//        }
//    }
//}
//
