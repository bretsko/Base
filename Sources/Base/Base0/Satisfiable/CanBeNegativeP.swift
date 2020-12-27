

public protocol CanBeNegativeP {
    // consider renaming to mustBeNegative

    /// negative cond, A must be NOT B
    var negative: Bool {get set}
}

//public extension CanBeNegativeP {
//    
//    mutating func setNegative() {
//        negative = true
//    }
//    mutating func setPositive() {
//        negative = false
//    }
//}
