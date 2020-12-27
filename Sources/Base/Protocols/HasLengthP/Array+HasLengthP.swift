


public extension Array where Element: HasLengthP {
    
    var sortedByLength: Array {
        sorted(by: {$0.length < $1.length})
    }
    var lengths: [Double] {
        map{$0.length}
    }
    
    var avgLength: Double? {
        lengths.average
    }
    var totalLength: Double? {
        lengths.sth?.sum
    }
    var minLength: Double? {
        lengths.sorted().first
    }
    var maxLength: Double? {
        lengths.sorted().last
    }
    
    /// if not empty
    func probabilityOf(length: Double) -> Double? {
        lengths.probability(of: length)
    }
    /// if not empty
    func probabilityOf(lengths: [Double]) -> Double? {
        lengths.probability(of: lengths)
    }
    
    var withMinLength: Array? {
        if let a = minLength {
            return filterSth{$0.length == a}
        }
        return nil
    }
    var withMaxLength: Array?  {
        if let a = maxLength {
            return filterSth{$0.length == a}
        }
        return nil
    }
    var withAvgLength: Array? {
        if let a = avgLength {
            return filterSth{$0.length == a}
        }
        return nil
    }
}


public extension Set where Element: HasLengthP { //? HIntervalT
    
    var sortedByLength: [E] {
        array.sortedByLength
    }
    var lengths: [Double] {
        array.lengths
    }
    
    var avgLength: Double? {
        array.avgLength
    }
    var totalLength: Double? {
        array.totalLength
    }
    var minLength: Double? {
        array.minLength
    }
    var maxLength: Double? {
        array.maxLength
    }
    
    /// if not empty
    func probabilityOf(length: Double) -> Double? {
        array.probabilityOf(length:length)
    }
    /// if not empty
    func probabilityOf(lengths: [Double]) -> Double? {
        array.probabilityOf(lengths:lengths)
    }
    
    var withMinLength: Set? {
        array.withMinLength?.set
    }
    var withMaxLength: Set?  {
        array.withMaxLength?.set
    }
    var withAvgLength: Set? {
        array.withAvgLength?.set
    }
}
