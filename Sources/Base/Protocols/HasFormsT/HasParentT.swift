


public protocol HasParentT: Hashable {
    associatedtype ParentType: Hashable
    
    var parent: ParentType {get}
}

public extension HasParentT where Self: HasAllFormsT {
    
    // allForms.map{$0.parent}.set
    static var allParents: Set<ParentType> {
        allForms.map{$0.parent}.set
    }
}



//MARK: -

//public protocol HasAllSubStrEnumTypes {
//    //associatedtype ChildStrEnumType: StrEnumT
//    static var allSubStrEnumTypes: [StrEnumT.Type] {get}
//
//}
//public extension HasAllSubStrEnumTypes {
//
//    init?(rawValue: Str) {
//        if let a = Self.allSubStrEnumTypes.first(where: { typeObj in
//            if let a = typeObj.init(rawValue) {
//
//            }
//        }){
//            self = a
//        } else {
//            return nil
//        }
//    }
//
//    static var allStrs: Set<Str> {
//        allSubStrEnumTypes.map{$0.allCases}.flatMap{$0}
//    }
//
//
//    var rawValue: Str {
//        //swicth
//        fatalError()
//    }
//
//    //    static var allForms: Set<Self> {
//    // switch and init
//    //        fatalError()
//    //    }
//}



//TODO: Array exts

//public extension StrEnumT { //HasAllFormsT
//     static var allForms: Set<Self> {
//        return allCases as! Set<Self>
//    }
//}

