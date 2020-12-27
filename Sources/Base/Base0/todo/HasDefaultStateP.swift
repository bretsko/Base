//
//
//
//public protocol HasDefaultStateP: HasSELF {
//    static var defaultState: Self {get}
//}
//public extension HasDefaultStateP {
//    var defaultState: Self {
//        return Self.defaultState
//    }
//}
//
//
////MARK:
//
//extension Array: HasDefaultStateP {}
//public extension Array {
//    typealias SELF = Array
//    static var defaultState: Array {
//        return []
//    }
//}
//
//extension Set: HasDefaultStateP {}
//public extension Set {
//    typealias SELF = Set
//    static var defaultState: Set {
//        return Set()
//    }
//}
//
//
////MARK: -
//
//public extension Array where Element: HasDefaultStateP & Equatable {
//    var hasDefaultState: Bool {
//        return contains(where: {$0 == E.defaultState})
//    }
//    var countDefaultStates: Int {
//        return count{$0 == E.defaultState}
//    }
//    var removingDefaultStates: Array? {
//        fatalError()
//        //return removing(while: {$0 == E.defaultState})?.sth
//    }
//}
//
//// bridge
//public extension Set where Element: HasDefaultStateP & Hashable {
//    var hasDefaultState: Bool {
//        return array.hasDefaultState
//    }
//    var countDefaultStates: Int {
//        return array.countDefaultStates
//    }
//    var removingDefaultStates: Set? {
//        return array.removingDefaultStates?.set
//    }
//}


//
//
//public protocol HasEDefaultStateT: HasDefaultStateP, Equatable {}
//
//public protocol HasHDefaultStateT: HasEDefaultStateT, Hashable {}
//
//
//
//extension Int: HasHDefaultStateT {}
//public extension Int {
//    typealias SELF = Int
//    static var defaultState: Int {
//        return 0
//    }
//}
//
//extension Double: HasHDefaultStateT {}
//public extension Double {
//    typealias SELF = Double
//    static var defaultState: Double {
//        return 0.0
//    }
//}
//
//extension Str: HasHDefaultStateT {}
//public extension Str {
//    typealias SELF = Str
//    static var defaultState: Str {
//        return ""
//    }
//}
