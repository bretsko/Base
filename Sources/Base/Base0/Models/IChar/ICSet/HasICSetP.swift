


//public protocol HasICSetP: HasRngP, HasStrP {
//    var icset: ICSet {get}
//}
//public extension HasICSetP {
//    var str: Str {
//         icset.str
//    }
//    var range: Rng {
//         icset.range
//    }
//}  
//


//public protocol HasICSetsP {
//    var icsets: [ICSet] {get}
//}
//public extension HasICSetsP {
//}



//public protocol ICSetHashableT: HasICSetP, Hashable {}
//
//public extension ICSetHashableT {
//    func hash(into hasher: inout Hasher) {
//        hasher icset
//    }
//}

//public protocol ICSetComparableT: HasICSetP, Comparable {}
//
//public extension ICSetComparableT {
//    static func < (lhs: Self, rhs: Self) -> Bool {
//         lhs.icset < rhs.icset
//    }
//}



//public protocol HasStaticICSetsP {
//    static var icsets: [ICSet] {get}
//}








//public protocol HasMutICSetP: HasICSetP, HasMutRngP, HasMutStrP {
//    var icset: ICSet {get set}
//}
//public extension HasMutICSetP {
//
//    var str: Str {
//        get {
//             icset.str
//        }
//        set {
//            icset.str = newValue
//        }
//    }
//    var range: Rng {
//        get {
//             icset.range
//        }
//        set {
//            icset.range = newValue
//        }
//
//    }
//}
//
//
//
//
//
//
//public protocol HasICSetsP {
//    var icsets: [ICSet] {get}
//}
//public extension HasICSetsP {
//}





//public protocol ICSetHashableT: HasICSetP, Hashable {}
//
//public extension ICSetHashableT {
//    func hash(into hasher: inout Hasher) {
//        hasher icset
//    }
//}

//public protocol ICSetComparableT: HasICSetP, Comparable {}
//
//public extension ICSetComparableT {
//    static func < (lhs: Self, rhs: Self) -> Bool {
//         lhs.icset < rhs.icset
//    }
//}



//public protocol HasStaticICSetsP {
//    static var icsets: [ICSet] {get}
//}






//
//
//
////Array+HasStrP
//public extension Array where Element: HasICSetP {
//
//    //TODO:
//
//    var icsets: [ICSet] {
//         map{$0.icset}
//    }
//    var icsetsSorted: [ICSet] {
//        L.notImpl()
//        // icsets.sorted()
//    }
//    var icsetSet: Set<ICSet> {
//         Set(icsets)
//    }
//
//    // merges icsets
//    var icsetPH: ICSet {
//        L.notImpl()
//        // map{$0.icset}.joined(separator: " ")
//    }
//
//
//    /// generates a string from the units
//    /// if presort is true, sorts the array before genrating the string
//    func makeICSet(presort: Bool = true,
//                  preprocess: Bool = true,
//                  separator: Str = " ") -> ICSet {
//
//        L.notImpl()
//        //        let elements1: [E]
//        //        if presort {
//        //            elements1 = sorted(by: {$0.str > $1.str})
//        //        } else {
//        //            elements1 = self
//        //        }
//        //        let elements2: [E]
//        //        if preprocess {
//        //            return elements1.map{
//        //                $0.str.preprocessed }
//        //                .joined(separator: separator)
//        //
//        //        } else {
//        //            return elements1.map{$0.str}
//        //                .joined(separator: separator)
//        //        }
//    }
//
//    //MARK: contain
//
//    //TODO:
//    //    func allContain(_ icset: ICSet) -> Bool {
//    //         allSatisfy{$0.icset.contains(icset)}
//    //    }
//    //    func noneContain(_ icset: ICSet) -> Bool {
//    //         allSatisfy{!$0.icset.contains(icset)}
//    //    }
//    //
//    //
//    //    func allContain(_ icset: ICSet) -> Bool {
//    //         allSatisfy{$0.icset.contains(str)}
//    //    }
//    //    func noneContain(_ icset: ICSet) -> Bool {
//    //         allSatisfy{!$0.icset.contains(str)}
//    //    }
//
//}

//
//
////TODO: try bridge via array
////Array+HasStrP
//public extension Set where Element: HasICSetP {
//
//    //TODO:
//
//    var icsets: [ICSet] {
//         map{$0.icset}
//    }
//    var icsetsSorted: [ICSet] {
//        L.notImpl()
//        // icsets.sorted()
//    }
//    var icsetSet: Set<ICSet> {
//         Set(icsets)
//    }
//
//    // merges icsets
//    var icsetPH: ICSet {
//        L.notImpl()
//        // map{$0.icset}.joined(separator: " ")
//    }
//
//
//    /// generates a string from the units
//    /// if presort is true, sorts the array before genrating the string
//    func makeICSet(presort: Bool = true,
//                  preprocess: Bool = true,
//                  separator: Str = " ") -> ICSet {
//
//        L.notImpl()
//        //        let elements1: [E]
//        //        if presort {
//        //            elements1 = sorted(by: {$0.str > $1.str})
//        //        } else {
//        //            elements1 = self
//        //        }
//        //        let elements2: [E]
//        //        if preprocess {
//        //            return elements1.map{
//        //                $0.str.preprocessed }
//        //                .joined(separator: separator)
//        //
//        //        } else {
//        //            return elements1.map{$0.str}
//        //                .joined(separator: separator)
//        //        }
//    }
//
//    //MARK: contain
//
//    //TODO:
//    //    func allContain(_ icset: ICSet) -> Bool {
//    //         allSatisfy{$0.icset.contains(icset)}
//    //    }
//    //    func noneContain(_ icset: ICSet) -> Bool {
//    //         allSatisfy{!$0.icset.contains(icset)}
//    //    }
//    //
//    //
//    //    func allContain(_ icset: ICSet) -> Bool {
//    //         allSatisfy{$0.icset.contains(str)}
//    //    }
//    //    func noneContain(_ icset: ICSet) -> Bool {
//    //         allSatisfy{!$0.icset.contains(str)}
//    //    }
//
//}
//
