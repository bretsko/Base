


public protocol HasFormsT {
    
    // Set ?
    var forms: [Self] {get}
}

//HasAllFormsT
public extension HasFormsT where Self: CaseIterableT {
    
    /// allCases.compactMap{$0}
    static var allForms: Set<Self> {
        Set(allCases)
    }
}

//MARK: - 

public protocol HasAllFormsT: Hashable {
    
    static var allForms: Set<Self> {get}
}


