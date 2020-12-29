

public typealias CaseIterableT = CaseIterable & Hashable

public extension CaseIterable {

    ///Note: case value and name can be different
    init?(caseName: Str) {
        for v in Self.allCases where "\(v)" == caseName {
            self = v
            return
        }
        return nil
    }
    //TODO: try use HasRandomCaseT
    /// crashes if enum is empty
    static var randomCase: Self {
        Array(allCases)[Int.rand(numCases)]
    }
    static var allCaseNames: Set<Str> {
        allCases.map{"\($0)"}.set
    }
    static var numCases: Int {
        allCases.count
    }
}

// HasAllFormsT
public extension CaseIterable where Self: Hashable  {
    static var allForms: Set<Self> {
        allCases.set
    }
}

