

public extension Array where Element: HasCountP {
    
    //TODO: ?
    // var allEmpty: Bool
    //var has1: Bool {
    //var hasMany: Bool {
    
    var counts: [Int] {
        map{$0.count}
    }
    var minCount: Int? {
        counts.min()
    }
    var maxCount: Int? {
        counts.max()
    }
    
    /// if not empty
    func probabilityOf(count: Int) -> Double? {
        counts.probability(of: count)
    }
    /// if not empty
    func probabilityOf(counts: [Int]) -> Double? {
        counts.probability(of: counts)
    }
}

public extension Set where Element: HasCountP {
    
    var counts: [Int] {
        map{$0.count}
    }
    /// if not empty
    var minCount: Int? {
        counts.min()
    }
    /// if not empty
    var maxCount: Int? {
        counts.max()
    }
    
    /// if not empty
    func probabilityOf(count: Int) -> Double? {
        counts.probability(of: count)
    }
    /// if not empty
    func probabilityOf(counts: [Int]) -> Double? {
        counts.probability(of: counts)
    }
}


//MARK: CollectionT

//public extension Array where Element: CollectionT {
//
////    var sortedByCount: [E] {
////         sorted(by: {$0.count < $1.count})
////    }
//}
//
//
//public extension Set where Element: CollectionT {
//
////    var sortedByCount: [E] {
////         array.sortedByCount
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
