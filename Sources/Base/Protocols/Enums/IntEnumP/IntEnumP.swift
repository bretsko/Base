

public protocol IntEnumP: IntRawValueInitableP, HasIntRawValueP, HasStaticIntsP, HasDescrP {}


public extension IntEnumP { //where Self: HasDescrP
    var descr: Str {
        Str(describing: self) + ": \(int)"
    }
}

public protocol IntEnumT: IntEnumP, HasAllFormsT, Comparable, CaseIterable {}

public extension IntEnumT {
    
    /// crashes if enum is empty
    static var randomCase: Self {
        Array(allCases)[Int.rand(allCases.count)]
    }
    //HasStaticIntsP
    static var ints: [Int] {
        allCases.map{$0.int}
    }

    static var sortedCases: [Self] {
        Set(allCases).sorted()
    }
    
    var nextCase: Self? {
        Self.sortedCases
            .first(where: { $0.rawValue > self.rawValue })
    }
    var prevCase: Self? {
        Self.sortedCases.reversed()
            .first(where: { $0.rawValue > self.rawValue })
    }
    
    var allNextCases: [Self]? {
        Self.sortedCases
            .filter { $0.rawValue > self.rawValue }
    }
    var allPrevCases: [Self]? {
        Self.sortedCases.reversed()
            .filter { $0.rawValue > self.rawValue }
    }
}




// used by Int enums
public protocol HasIntAndDescrP: HasIntP, HasDescrP {}
public extension HasIntAndDescrP {
    var descr: Str {
        Str(describing: self) + ": \(int)"
    }
}



public extension Array where Element: IntEnumP {
    var ints: [Int] {
        map{$0.int}
    }
}
public extension Set where Element: IntEnumP {
    var ints: Set<Int> {
        map{$0.int}.set
    }
}








