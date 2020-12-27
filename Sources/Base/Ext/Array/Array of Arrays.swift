

public extension Array where Element: RandomAccessCollection {

    var sortedByLength: [E]? {
        sorted(by: {$0.count < $1.count}).sth
    }
    var lengths: [Int]? {
        map{$0.count}.sth
    }
    /// if not empty
    var avgLength: Double {
        lengths?.average.d ?? 0
    }
    
    /// if not empty
    var shortest: E? {
        sortedByLength?.first
    }
    /// if not empty
    var longest: E? {
        sortedByLength?.last
    }

    
    /// if not empty
    var minLength: Int? {
        shortest?.count
    }
    /// if not empty
    var maxLength: Int? {
        longest?.count
    }
      
    /// if not empty
    func probabilityOf(arrayLength: Int) -> Double? {
        lengths?.probability(of: arrayLength)
    }
    /// if not empty
    func probabilityOf(arrayLengths: [Int]) -> Double? {
        self.lengths?.probability(of: arrayLengths)
    }
    
}

//MARK: Array+Hashable Arrays

// Array of Sets<Element> OR [Element]
public extension Array where Element: Collection, Element.Element: Hashable { //, Element.Index == Int
    
    typealias SetType = Set<Element.Element>
    
    var sets: [SetType] {
        map{$0.set}
    }
    
    var setUnion: SetType {
        sets.reduce(SetType(), { $0.union($1) })
    }
}
