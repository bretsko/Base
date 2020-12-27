//// NSScanner+Swift.swift
//// A set of Swift-idiomatic methods for NSScanner
////
//// (c) 2015 Nate Cook, licensed under the MIT license
//
////
//extension Scanner {
//
//    /// Returns a string, scanned as long as characters from a given character set are encountered, or `nil` if none are found.
//    func scanCharacters(from set: CharacterSet) -> Str? {
//        var value: NSString? = ""
//        if scanCharacters(from: set, into: &value) {
//            return value as Str?
//        }
//        return nil
//    }
//
//    /// Returns a string, scanned until a character from a given character set are encountered, or the remainder of the scanner's string. Returns `nil` if the scanner is already `atEnd`.
//    func scanUpToCharacters(from set: CharacterSet) -> Str? {
//        var value: NSString? = ""
//        if scanUpToCharacters(from: set, into: &value) {
//            return value as Str?
//        }
//        return nil
//    }
//
//    /// Returns the given string if scanned, or `nil` if not found.
//    @discardableResult func scanString(_ str: Str) -> Str? {
//        var value: NSString? = ""
//        if scanString(str, into: &value) {
//            return value as Str?
//        }
//        return nil
//    }
//
//    /// Returns a string, scanned until the given string is found, or the remainder of the scanner's string. Returns `nil` if the scanner is already `atEnd`.
//    func scanUpTo(_ str: Str) -> Str? {
//        var value: NSString? = ""
//        if scanUpTo(str, into: &value) {
//            return value as Str?
//        }
//        return nil
//    }
//}
