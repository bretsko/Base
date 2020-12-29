


@_exported import Foundation
@_exported import Collections
import Algorithms



//TODO:
// test
// add later https://github.com/apple/swift-evolution/pull/935

public extension Collection {
    
    /// let numbers = [10, 20, 30, 10, 40, 40, 10, 20]
    /// let chunks = numbers.grouped(by: { $0 <= $1 })
    /// [[10, 20, 30], [10, 40, 40], [10, 20]]
    func grouped(by belongInSameGroup: @escaping (Element, Element) -> Bool) -> [SubSequence] {
        chunked(by: belongInSameGroup)
    }
}


/// let seasons = ["winter", "spring", "summer", "fall"]
/// for (year, season) in doubleForLoop(1900...2020, seasons) {
///     // ...
/// }
///
/// Is equivalent to:
/// for years in 1900...2020 {
///     for season in seasons {
///         // ...
///     }
/// }
public func doubleForLoop<T1: Sequence, T2: Collection>(
    _ s1: T1, _ s2: T2) -> Product2Sequence<T1, T2> {
    product(s1,s2)
}


public extension Array {
    
    /// let numbers = [10, 20, 30, 10, 40, 40, 10, 20]
    /// let chunks = numbers.grouped(by: { $0 <= $1 })
    /// [[10, 20, 30], [10, 40, 40], [10, 20]]
    func grouped(by belongInSameGroup: @escaping (Element, Element) -> Bool) -> [Array] {
        chunked(by: belongInSameGroup).map{$0.array}
    }
    
    /// Returns combinations of a particular size of the elements in a collection.
    ///
    /// This example prints the different combinations of three from an array of four colors:
    ///
    ///     let colors = ["fuchsia", "cyan", "mauve", "magenta"]
    ///     for combo in colors.combinations(ofCount k: 3) {
    ///         print(combo.joined(separator: ", "))
    ///     }
    ///     // fuchsia, cyan, mauve
    ///     // fuchsia, cyan, magenta
    ///     // fuchsia, mauve, magenta
    ///     // cyan, mauve, magenta
    ///
    /// The returned collection presents combinations in a consistent order, where
    /// the indices in each combination are in ascending lexicographical order.
    /// That is, in the example above, the combinations in order are the elements
    /// at `[0, 1, 2]`, `[0, 1, 3]`, `[0, 2, 3]`, and finally `[1, 2, 3]`.
    ///
    /// If size is zero, the resulting sequence has exactly one element, an empty
    /// array. If size is greater than the number of elements in this sequence, the resulting sequence has no elements.
    /// Values that are repeated in the original collection are always treated as separate values in the resulting combinations
    func combis(withSize size: Int) -> [Array] {
        combinations(ofCount: size).map{$0.array}
    }
    
    
    // remove ??
    /// let numbers = [10, 20, 30, 40]
    /// let groups = numbers.chunked(into: 2)
    /// [[10, 20], [30, 40]]
    func chunked(into size: Int) -> [Array] {
        //grouped(bySize: size)
        stride(from: 0, to: len, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
    
    
    /// Returns a collection of the permutations of this collection of the
    /// specified length.
    ///
    /// This example prints the different permutations of two elements from an
    /// array of three names:
    ///
    ///     let names = ["Alex", "Celeste", "Davide"]
    ///     for perm in names.permutations(ofCount: 2) {
    ///         print(perm.joined(separator: ", "))
    ///     }
    ///     // Alex, Celeste
    ///     // Alex, Davide
    ///     // Celeste, Alex
    ///     // Celeste, Davide
    ///     // Davide, Alex
    ///     // Davide, Celeste
    ///
    /// The permutations present the elements in increasing lexicographic order
    /// of the collection's original ordering (rather than the order of the
    /// elements themselves). The first permutation will always consist of
    /// elements in their original order, and the last will have the elements in
    /// the reverse of their original order.
    ///
    /// Values that are repeated in the original collection are always treated as
    /// separate values in the resulting permutations:
    ///
    ///     let numbers = [20, 10, 10]
    ///     for perm in numbers.permutations() {
    ///         print(perm)
    ///     }
    ///     // [20, 10, 10]
    ///     // [20, 10, 10]
    ///     // [10, 20, 10]
    ///     // [10, 10, 20]
    ///     // [10, 20, 10]
    ///     // [10, 10, 20]
    ///
    /// If size is zero, the resulting sequence has exactly one element, an
    /// empty array. If size is greater than the number of elements in this
    /// sequence, the resulting sequence has no elements.
    ///
    /// - Parameter size: The number of elements to include in each permutation.
    ///   If size is `nil`, the resulting sequence represents permutations
    ///   of this entire collection.
    func permutations(withSize size: Int? = nil) -> [Array] {
        permutations(ofCount: size).map{$0.array}
    }
    
    
    //MARK: - shuffle
    
    // http://stackoverflow.com/questions/37843647/shuffle-array-swift-3
    ///  Shuffle array using Fisher-Yates Algorithm
    mutating func shuffle() {
        guard len > 1 else { return }
        
        for i in startIndex ..< endIndex - 1 {
            let randomIdx = Int.rand(endIndex - i) + i
            if i != randomIdx { swapAt(i, randomIdx) }
        }
    }
    
    ///  Shuffled version of array. (Using Fisher-Yates Algorithm)
    /// [1, 2, 3, 4, 5].shuffled // return a shuffled version from given array e.g. [2, 4, 1, 3, 5].
    /// - Returns: the array with its units shuffled.
    var shuffled: Array {
        var a = self
        a.shuffle()
        return a
    }
    
    
    //TODO: reimpl using Apple Algorithms
    // try to make the same func with generic param
    /// uses the checking block to filter matching combinations
    func filterCombis(num: Int = 6,
                      with checkBlock: (Array) -> Bool) -> [Array]? {
        guard num > 1,
              let sets = combiSets(num: num) else {
            L.unhandled()
        }
        
        // L.info("Combi: " + combi. )
        var r = [Array]()
        
        sets.enumerated().forEach { i, combiSet in
            
            //TODO: try improve this
            if i == 0 { // has only 1 array - self
                
                guard combiSet.hasSth,
                      let unit1 = combiSet[0].first else {
                    L.unhandled()
                    //return nil
                }
                if checkBlock([unit1]) {
                    r.append([unit1])
                }
                
            } else {
                // combiSet can be empty here
                combiSet.forEach {
                    if checkBlock($0) {
                        r.append($0)
                    }
                }
            }
        }
        return r.sth
    }
    
    private func strideCombi(_ num: Int) -> [Array]? {
        chunked(into: num).filter{$0.len == num}.sth
        
        // stride(from: 0, to: len, by: num).map {
        //    Array(self[$0..<Swift.min($0 + num, len)])
        // }.filter{$0.len == num}.sth
    }
    
    private  func combiSets(num: Int) -> [ [Array] ]? {
        guard num > 1 else {
            L.unhandled()
        }
        
        var all = [[self]] // putting single array = self
        
        // starting with pairs
        for i in 2...num {
            if let a = strideCombi(i) {
                all.append(a)
            }
        }
        
        return all.sth
        //Combis(units: self, pairs: pairs, triples: triples, fours: fours, fives: fives, sixes: sixes)
    }
    
    //MARK: Array+Str+Combis
    
    var pairs: [(E, E)]? {
        stride(from: 0, to: len - 1, by: 2).map {
            (self[$0], self[$0+1])}.sth
    }
    var triples: [(E, E, E)]? {
        stride(from: 0, to: len - 1, by: 3).map {
            (self[$0], self[$0+1], self[$0+2])}.sth
    }
    
    var fours: [(E, E, E, E)]? {
        L.notImpl()
        // stride(from: 0, to: len - 1, by: 3).map {
        // (self[$0], self[$0+1], self[$0+2])}.sth
    }
    var fifths: [(E, E, E, E, E)]? {
        L.notImpl()
        // stride(from: 0, to: len - 1, by: 3).map {
        // (self[$0], self[$0+1], self[$0+2])}.sth
    }
    var sixs: [(E, E, E, E, E, E)]? {
        L.notImpl()
        // stride(from: 0, to: len - 1, by: 3).map {
        // (self[$0], self[$0+1], self[$0+2])}.sth
    }
    
    //MARK: -
    
    //TODO: try use Apple's Combinations
    /// A tuple representing a combination.
    typealias Combination<T> = (left: E, right: T)
    
    /// Combines each element with each element of a given array.
    ///
    /// Also known as: Cartesian product.
    ///
    /// - Parameters:
    ///   - other: Other array to combine the elements with.
    /// - Returns: An array of tuples with the elements of both arrays combined.
    func combinations<T>(with other: [T]) -> [Combination<T>] {
        var r = [(E, T)]()
        forEach { elem1 in
            other.forEach { elem2 in
                r.append((elem1, elem2))
            }
        }
        return r
    }
}


