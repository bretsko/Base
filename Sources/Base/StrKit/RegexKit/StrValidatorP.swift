

public protocol StrValidatorP {
    
    func isValid(_ str: Str) -> Bool
}

public final class RegexValidator: StrValidatorP {
    
    fileprivate let regex: Regex
    
    public init(_ regex: Regex) {
        self.regex = regex
    }
    
    public init(pattern: Str) {
        regex = Regex(pattern)
    }
    
    public func isValid(_ str: Str) -> Bool {
        regex.isMatch(str)
    }
}



/// Validates email address string.
//public final class EmailAddressValidator: StrValidatorP {
//    
//    private static let rfc2822 =
//        "^(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}" +
//        "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" +
//        "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-" +
//        "z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5" +
//        "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" +
//        "9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" +
//        "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])$"
//    
//    private static let regex = Regex(rfc2822, [.caseInsensitive])
//    
//    public init() {}
//    
//    public func isValid(_ emailAddress: Str) -> Bool {
//        Self.regex.isMatch(emailAddress)
//    }
//}

//
////FIXME: check logic
///// Validates Int string.
//public class IntValidator: StrValidatorP {
//
//    private static let pattern = "^\\d+$"
//
//    private static let regex = Regex(pattern)
//
//    private let range: CountableClosedRange<Int>?
//
//    public init() {
//        range = nil
//    }
//
//    public init(_ range: CountableClosedRange<Int>) {
//        self.range = range
//    }
//
//    public func isValid(_ intString: Str) -> Bool {
//        guard Self.regex.isMatch(intString) else {
//            return false
//        }
//        guard let value = Int(intString) else {
//            return false
//        }
//        return true
////        if let range = range, case range = value {
////            return true
////        } else {
////            return true // false ???
////        }
//
//        //WAS
//        //if Self.regex.isMatch(intString) {
//        //    if let value = Int(intString) {
//        //        if let range = range {
//        //            if case range = value {
//        //                return true
//        //            }
//        //        } else {
//        //            return true
//        //        }
//        //    }
//        //}
//        //return false
//    }
//}
//
