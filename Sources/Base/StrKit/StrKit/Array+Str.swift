

//@_exported import Base
//@_exported import RegexKit


public extension Array where Element == Str {
    
    var filterWords: [Str]? {
        filter{$0.hasSth}.sth
    }
    var icsets: [ICSet] {
         map{$0.icset}
    }
    var icsetSet: Set<ICSet> {
         icsets.set
    }
    
    
    //MARK: -
    
//    func allContain(_ str: Str) -> Bool {
//         allSatisfy{$0.contains(str)}
//    }
//    func noneContain(_ str: Str) -> Bool {
//         allSatisfy{!$0.contains(str)}
//    }
//    /// some -> maybe all!
//    func someContain(_ str: Str) -> Bool {
//         has{$0.contains(str)}
//    }
    
    /// generates a string from the units
    /// if presort is true, sorts the array before genrating the string
//    func makeString(presort: Bool = true,
//                    preprocess: Bool = true,
//                    separator: Str = " ") -> Str {
//        let elements1: [E]
//        if presort {
//            elements1 = sorted()
//        } else {
//            elements1 = self
//        }
//        let elements2: [E]
//        if preprocess {
//            return elements1.map{
//                $0.preprocessed }
//                .joined(separator: separator)
//
//        } else {
//            return elements1.joined(separator: separator)
//        }
//    }
}


//TODO: try bridge via array
public extension Set where Element == Str {
    
    var filterWords: Set? {
        filter{$0.hasSth}.sth
    }
    
    var icsets: [ICSet] {
         map{$0.icset}
    }
    var icsetSet: Set<ICSet> {
         icsets.set
    }
    
    //MARK: -
    
    //    func allContain(_ str: Str) -> Bool {
    //         allSatisfy{$0.contains(str)}
    //    }
    //    func noneContain(_ str: Str) -> Bool {
    //         allSatisfy{!$0.contains(str)}
    //    }
    //    /// some -> maybe all!
    //    func someContain(_ str: Str) -> Bool {
    //         has{$0.contains(str)}
    //    }
    
    /// generates a string from the units
    /// if presort is true, sorts the array before genrating the string
    //    func makeString(presort: Bool = true,
    //                    preprocess: Bool = true,
    //                    separator: Str = " ") -> Str {
    //        let elements1: [E]
    //        if presort {
    //            elements1 = sorted()
    //        } else {
    //            elements1 = self
    //        }
    //        let elements2: [E]
    //        if preprocess {
    //            return elements1.map{
    //                $0.preprocessed }
    //                .joined(separator: separator)
    //
    //        } else {
    //            return elements1.joined(separator: separator)
    //        }
    //    }
}




