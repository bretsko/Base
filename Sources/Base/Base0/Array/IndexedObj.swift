
public protocol IndexedObjT: IdxHashableT, IdxCmpT {
    associatedtype T
    var obj: T {get}
}


/// Hashable and Equatable with indexes
public struct IndexedObj<T: CustomStringConvertible>: IndexedObjT, CustomStringConvertible {
    
    public var idx: Int
    
    public var obj: T
}
public extension IndexedObj {
    
    init(idx: Int, _ obj: T) {
        self.idx = idx
        self.obj = obj
    }
    
    static func == (lhs: Self, rhs:Self) -> Bool {
        lhs.idx == rhs.idx
    }
    
    //public extension IndexedObj where T: HasDescrP {
    var description: Str {
        "\(idx), " + obj.description
    }
}


public typealias IdxStr = IndexedObj<Str>


//MARK: -


