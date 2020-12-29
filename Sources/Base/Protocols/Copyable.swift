

public protocol Copyable: AnyObject {
    func copy() -> Self
}
public extension Array where E: Copyable {
    
    /// map{ $0.copy() }
    func copy() -> Array {
        map{ $0.copy() }
    }
}
public extension Set where E: Copyable {

    /// map{ $0.copy() }
    func copy() -> Set {
        map{ $0.copy() }.set
    }
}

public typealias CanCopyAndInitP = Copyable & CanInitP



//MARK: -

public protocol CopyableT: AnyObject, HasSELF {
    func copy() -> SELF
}
public extension Array where E: CopyableT {
    
    /// map{ $0.copy() }
    func copy() -> Array<E.SELF> {
        map{ $0.copy() }
    }
}
public extension Set where E.SELF: Hashable, E: CopyableT {
    
    /// map{ $0.copy() }
    func copy() -> Set<E.SELF> {
        map{ $0.copy() }.set
    }
}

public typealias CanCopyAndInitT = CopyableT & CanInitP


