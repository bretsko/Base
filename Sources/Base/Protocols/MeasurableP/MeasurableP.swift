


public protocol MeasurableP {
 
    var measure: Double { get }
}

/// for ex cold, cool, warm, hot
public protocol MeasurableEnumT: MeasurableP, ComparableEnumT {}

//TODO: may need to remove extension HasStrRawValueP where Self: Comparable
//public extension MeasurableEnumT {
//    static func < (lhs: Self, rhs: Self) -> Bool {
//        lhs.measure < rhs.measure
//    }
//}


//public protocol MeasurableIntEnumQP: PExprP {
//    var enumValue: Int {get}
//}
//
///// for ex hot, warm, cool, cold
//public struct MeasurableIntEnumQG<EnumType: IntEnumT>: MeasurableIntEnumQP {
//
//    /// 0.0 - 1.1
//    public var value: EnumType
//}
//public extension MeasurableIntEnumQG {
//
//    init(_ value: EnumType) {
//        self.value = value
//    }
//
//    var measure: Int {
//        value.rawValue
//    }
//    var enumValue: Int {
//        value.rawValue
//    }
//    var descr: Str {
//        L.notImpl()
//    }
//}
//
//
//public extension Array where E: MeasurableIntEnumQP {
//    var sortedByIntValue: [E] {
//        sorted(by: \E.enumValue)
//    }
//}
