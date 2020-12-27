

//@_exported import Base

//TODO: use https://github.com/onmyway133/Smile
//public extension Str {
    
//    var containsOnlyEmojis: Bool {
//        //TODO: return chars.contains(only: { $0.isEmoji })
//
//        if count == 0 {
//            return false
//        }
//        for char in self {
//            if !char.isEmoji {
//                return false
//            }
//        }
//        return true
//    }
//
//    var containsEmoji: Bool {
//        //TODO: return chars.contains(where: { $0.isEmoji })
//        for char in self {
//            if char.isEmoji {
//                return true
//            }
//        }
//        return false
//    }
    
    
    //    static var emojiScalars: [UInt32] {
    //        // http://stackoverflow.com/questions/30757193/find-out-if-character-in-string-is-emoji
    //
    //        struct SymbolScalars {
    //
    //            /// Special Characters
    //            static let a: [UInt32] = [0x3030, 0x00AE, 0x00A9]
    //
    //            /// Emoticons
    //            static let b = Array<UInt32>(0x1D000 ... 0x1F77F)
    //
    //            /// Misc symbols and Dingbats
    //            static let c = Array<UInt32>(0x2100 ... 0x27BF)
    //
    //            /// Variation Selectors
    //            static let d = Array<UInt32>(0xFE00 ... 0xFE0F)
    //
    //            /// Supplemental Symbols and Pictographs
    //            static let e = Array<UInt32>(0x1F900 ... 0x1F9FF)
    //
    //            static var all: [UInt32] {
    //                return a + b + c + d + e
    //            }
    //        }
    //        return SymbolScalars.all
    //    }
    
    //    var isEmoji: Bool {
    //        // http://stackoverflow.com/questions/30757193/find-out-if-character-in-string-is-emoji
    //        return CS.emojiScalars.contains(unicodeScalars.value)
    //    }
    
    
    ///  Check if string contains one or more emojis.
    /// "Hello 😀".containEmoji -> true
    //    var containsEmoji: Bool {
    //        // http://stackoverflow.com/questions/30757193/find-out-if-character-in-string-is-emoji
    //        return unicodeScalars.has { $0.isEmoji } // or chars
    //    }
    
    //    var containsOnlyEmoji: Bool {
    //
    //        return hasSth && !unicodeScalars.contains(where: {
    //            !$0.isEmoji && !$0.isZeroWidthJoiner
    //        })
    //    }
    
    // The next tricks are mostly to demonstrate how tricky it can be to determine emoji's
    // If anyone has suggestions how to improve this, please let me know
    //    var emojiString: Str {
    //        return emojiScalars.map { Str($0) }.reduce("", +)
    //    }
    //
    //    var emojis: [Str] {
    //        return filter { Str($0).containsEmoji }.map { Str($0) }
    //    }
    //
    //    fileprivate var emojiScalars: [UnicodeScalar] {
    //
    //        var chars: [UnicodeScalar] = []
    //        var previous: UnicodeScalar?
    //        unicodeScalars.forEach { cur in
    //
    //            if let previous = previous,
    //               previous.isZeroWidthJoiner,
    //               cur.isEmoji {
    //                chars.append(previous)
    //                chars.append(cur)
    //
    //            } else if cur.isEmoji {
    //                chars.append(cur)
    //            }
    //            previous = cur
    //        }
    //        return chars
    //    }
    
    
    //    var isSingleEmoji: Bool {
    //        return glyphCount == 1 && containsEmoji
    //    }
    
    //test, alternative is below
    //    var containEmoji: Bool {
    //        // http://stackoverflow.com/questions/30757193/find-out-if-character-in-string-is-emoji
    //        for scalar in unicodeScalars {
    //            switch scalar.value {
    //            case 0x3030, 0x00AE, 0x00A9, // Special Characters
    //            0x1D000...0x1F77F, // Emoticons
    //            0x2100...0x27BF, // Misc symbols and Dingbats
    //            0xFE00...0xFE0F, // Variation Selectors
    //            0x1F900...0x1F9FF: // Supplemental Symbols and Pictographs
    //                return true
    //            default:
    //                continue
    //            }
    //        }
    //        return false
    //    }
    
    
    //    var emojis: [Str] {
    //
    //        var scalars: [[UnicodeScalar]] = []
    //        var currentScalarSet: [UnicodeScalar] = []
    //        var previousScalar: UnicodeScalar?
    //
    //        for scalar in emojiScalars {
    //
    //            if let prev = previousScalar, !prev.isZeroWidthJoiner && !scalar.isZeroWidthJoiner {
    //
    //                scalars.append(currentScalarSet)
    //                currentScalarSet = []
    //            }
    //            currentScalarSet.append(scalar)
    //
    //            previousScalar = scalar
    //        }
    //
    //        scalars.append(currentScalarSet)
    //
    //        return scalars.map { $0.map{ Str($0) } .reduce("", +) }
    //    }
//}
