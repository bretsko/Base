
@_exported import Foundation


public protocol HasSELF {
    associatedtype SELF
}

public protocol CanInitP {
    init()
}

public protocol SummableT {
    static func +(lhs: Self, rhs: Self) -> Self
}

public protocol HasRandomCaseT {
    static var randomCase: Self {get}
}

public protocol RepeatsP {
    var repeats: Bool { get }
}


// maybe move to VariantKit
public protocol VariantsRepresentableT: Hashable {
    
    init(variants: Set<Self>)
    
    /// returns all variants - if type can be represented with them
    var variants: Set<Self>? {get}
}

