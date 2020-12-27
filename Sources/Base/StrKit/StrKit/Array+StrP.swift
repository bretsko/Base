

//@_exported import Base
//@_exported import RegexKit

public typealias StrP = StringProtocol


public extension Array where Element: StrP {
    
    /// joined(separator: " ")
    var joinedWords: Str {
        joined(separator: " ")
    }
    /// joined(separator: "\n")
    var joinedLines: Str {
        joined(separator: "\n")
    }
    
    /// joined(separator: " ")
    //    var joined: Str {
    //        joined(separator: " ")
    //    }
}


public extension ArraySlice where Element: StrP {
    
    /// joined(separator: " ")
    var joinedWords: Str {
        joined(separator: " ")
    }
    /// joined(separator: "\n")
    var joinedLines: Str {
        joined(separator: "\n")
    }
    
    /// joined(separator: " ")
    //    var joined: Str {
    //        joined(separator: " ")
    //    }
}


//public extension ArraySlice where Element: StrP {
//
/// joined(separator: " ")
//    var joined: Str {
//         array.joined
//    }
//
//    /// joined(separator: " ")
//    var joinedWords: Str {
//        array.joinedWords
//    }
//
//    /// joined(separator: "\n")
//    var joinedLines: Str {
//        array.joinedLines
//    }
//}



//public extension StringProtocol where Self: RangeReplaceableCollection {
//    mutating func removeAllNonNumeric() {
//        removeAll { !("0"..."9" ~= $0) }
//    }
//}
