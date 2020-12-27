


//public protocol CanMakeStrWithLocaleP {
//    
//    func str(with locale: LocaleID) -> Str
//}
//
//public extension CanMakeStrWithLocaleP where Self: HasAllFormsT {
//    
//    static func allStrings(with locale: LocaleID = .current) -> Set<Str> {
//        allForms.map {
//            $0.str(with:locale)
//        }.set
//    }
//    
//    init?(_ str: Str,
//          _ locale: LocaleID = .current) {
//        
//        if let a = Self.allForms.first(where: {
//            $0.str(with:locale) == str
//        }) {
//            self = a
//        } else {
//            return nil
//        }
//    }
//}



//MARK: - CanInitWithAnyLocaleT

//public protocol HasAllFormsWithLocaleT: HasAllFormsT {
//
//    static func allForms(with locale: LocaleID) -> Set<Self>
//}
//public extension HasAllFormsWithLocaleT {
//
//    // HasAllFormsT
//    static var allForms: Set<Self> {
//        LocaleID.allCases.map {
//            allForms(with:$0)
//        }.flatMap{$0}.set
//    }
//}

// ?
//public protocol CanInitWithAnyLocaleT: HasAllFormsWithLocaleT {}
