//
//
////TODO: subclass from this protocol by adding Str value, etc
//// the same as CaseIterableP ?
//public protocol HasAllStatesP { //HasAvgStateP
//    static func allStates() -> [Self]
//}
//
//public extension HasAllStatesP {
//    
//    static var numStates: Int {
//        return allStates().len
//    }
//    
//    /// single obj probability = 1 / numStates
//    static var singleObjProbability: Double {
//        return 1.0 / numStates.d
//    }
//    
//    
//    //BAD
//    /// does not check if objs in objSet are different
//    /// objSet.len.d / allStates().len.d
//    //    static func probability(of objSet: [Self]) -> Double {
//    //        return probability(of: objSet.len)
//    //    }
//    
//    //TODO: ??
//    /// probability that the provided count of different objs appears when randomly picking or generating such objs
//    //    static func probability(of diffNumObjs: Int) -> Double {
//    //        crashIfNegative(diffNumObjs)
//    //        return diffNumObjs.d / numStates.d
//    //    }
//    
//    //    static var allStates_op: [Self?] {
//    //        return allStates as [Self?]
//    //    }
//}
//
////public extension HasAllStatesP where Self: CaseIterable {
////    
////    static func allStates -> [Self] {
////        return allCases as! [Self] //?
////    }
////}
//
//
//// the same as HasAllStatesP ?
////public protocol CaseIterableP {
////    static var allValues: [Self] {get}
////}
////public extension CaseIterableP {
////}
//
//
//
//
//TODO:
////public extension Array where Element: HasAllStatesP {
////}
//
//
////public extension Set where Element: HasAllStatesP {
////}



//MARK: - HasAllHStatesT

//public protocol HasAllEStatesT: HasAllStatesP, Equatable {}
////public extension HasAllEStatesT {}
//
//
//public protocol HasAllHStatesT: HasAllEStatesT, Hashable {}
////public extension HasAllHStatesT {}


//public extension Array where Element: HasAllHStatesT {
//}

//public extension Set where Element: HasAllHStatesT {
//}


//MARK: extensions


//extension Bool: HasAllHStatesT, HasSELF {}
//public extension Bool {
//    typealias SELF = Bool
//
//    static func allStates() -> [Bool] {
//        return [true, false]
//    }
//}
//
//
//
//extension Int: HasAllHStatesT {}
//public extension Int {
//
//    static func allStates() -> [Int] {
//        return Array(Int.min...Int.max)
//    }
//}
//
//extension Double  {} //: HasAllHStatesT
//public extension Double {
//
//    //    static func allStates() -> [Double] {
//    //        fatalError()
//    //    }
//}
//
//
//
//extension Char: HasAllHStatesT, HasSELF {}
//public extension Char {
//    typealias SELF = Char
//
//    static func allStates() -> [Char] {
//        return CharSet.alphanumerics.allChars! //??
//    }
//}


