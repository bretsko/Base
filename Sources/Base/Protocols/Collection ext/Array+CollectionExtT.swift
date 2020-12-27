

public extension Array where Element: CollectionExtT {
    
    //TODO: ?
    // var allEmpty: Bool
    //var has1: Bool {
    //var hasMany: Bool {
}

//public extension Set where Element: CollectionP {
//
//}


//MARK: CollectionT

//public extension Array where Element: CollectionT {
//
////    var sortedByCount: [E] {
////        return sorted(by: {$0.count < $1.count})
////    }
//}
//
//
//public extension Set where Element: CollectionT {
//
////    var sortedByCount: [E] {
////        return array.sortedByCount
////    }
//}



//public func quicksort<T: Comparable>(_ a: [T]) -> [T] {
//    guard a.count > 1 else { return a }
//
//    let pivot = a[a.count/2]
//    let less = a.filter { $0 < pivot }
//    let equal = a.filter { $0 == pivot }
//    let greater = a.filter { $0 > pivot }
//
//    return quicksort(less) + equal + quicksort(greater)
//}
