


public protocol Satisfiable {
    /// satisfied == mustBeTrue 
    var mustBeTrue: Bool {get}
}


public extension Array where Element: Satisfiable {
    /// if empty returns true
    var mustBeTrue: Bool {
        allSatisfy{$0.mustBeTrue}
    }
}
public extension Set where Element: Satisfiable {
    /// if empty returns true
    var mustBeTrue: Bool {
        allSatisfy{$0.mustBeTrue}
    }
}


