

// ! isEmpty conflicts with Swift data structures
public protocol CollectionExtT: Collection, HasElementTypeT, HasCountP, CanBeEmptyP {}
//public extension CollectionExtT {}

extension Array: CollectionExtT {}
extension ArraySlice: CollectionExtT {}
extension Set: CollectionExtT {}
extension Data: CollectionExtT {}
extension Dictionary: CollectionExtT {}
extension Str: CollectionExtT {}
extension Substr: CollectionExtT {}


