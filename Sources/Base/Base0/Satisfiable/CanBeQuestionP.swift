


public protocol CanBeQuestionP {
    
    var question: Bool {get set}
}
public extension CanBeQuestionP where Self: CanBeNegativeP {
    
    /// !question && !negative
    var statement: Bool {
        !question && !negative
    }
}


//public protocol CanBeContractedP {
//
//    /// contracted form, for ex isn't, aren't
//    var contracted: Bool {get set}
//}
//
//public protocol CanBePassiveP {
//
//    var passive: Bool {get set}
//}

