

public protocol CanBeEmptyP {
    var isEmpty: Bool {get}
}
public extension CanBeEmptyP {

    var sth: Self? {
         isEmpty ? nil : self
    }
    var hasSth: Bool {
         !isEmpty
    }
}

