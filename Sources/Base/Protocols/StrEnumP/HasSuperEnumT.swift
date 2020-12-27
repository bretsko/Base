

//TODO: cannot impl but may be a way ...
//public protocol HasSuperEnumT: HasAllFormsT {
//    associatedtype SuperEnumTypeT: HasAllFormsT
//    
//    var superEnum: SuperEnumTypeT {get}
//}
//public extension HasSuperEnumT {
//
//    static var allSuperTypes: Set<SuperEnumTypeT> {
//        allForms.map{$0.superEnum}.set
//    }
//}
//
//    
//public protocol HasChildEnumT {
////    associatedtype ChildEnumType: HasSuperEnumT
//    
//    static var allChildEnumTypes: [HasSuperEnumT.Type] {get}
//}
//
//public extension HasAllFormsT where Self: HasChildEnumT, ChildEnumType.SuperEnumTypeT == Self  {
//
//    static var allForms: Set<Self> {
//        allChildEnumTypes.map{$0.allSuperTypes}.flatMap{$0}.set
//    }
//}
