//
//
//public protocol RangedP: HasMutRngP {
//    associatedtype IndexedType: HasDescrP
//    
//    var obj: IndexedType {get}
//}
//
//
//public struct RangedG<T: HasDescrP>: RangedP {
//    
//    public var obj: T
//    
//    /// currently used to refer to parts of StxUnit
//    public var rng: Rng
//}
//public extension RangedG {
//    
//    init(_ obj: T, _ rng: Rng) {
//        self.obj = obj
//        self.rng = rng
//    }
//    
//    //MARK: inits with rng
//    
//    init(_ obj: T, from: Int, to: Int) {
//        self.init(obj, Rng(from, to))
//    }
//    
//    init(_ obj: T, _ idxSet: Set<Int>) {
//        self.init(obj, Rng(idxSet))
//    }
//    
//    //TODO: if contiguous - make rng?
//    init(_ obj: T, _ indexes: [Int]) {
//        self.init(obj, Rng(indexes))
//    }
//    init(obj: T, _ index: Int) {
//        self.init(obj, Rng([index]))
//    }
//    
//    var descr: Str {
//        var r = "RangedG"
//        r += ", obj: \(obj)"
//        r += ", rng: \(rng)"
//        return r
//    }
//}
//


// ??
//public struct ModelWithIntRangeG<T>: HasIntRangeP { //Equatable
//
//    public var model: T
//    public var rng: Rng
//
//    public init(model: T,
//                rng: Rng){
//        self.model = model
//        self.rng = rng
//    }
//}
