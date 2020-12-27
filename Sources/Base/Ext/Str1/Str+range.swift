


public extension StrP where Index == StrIdx {
    
    func nsRange(from range: Range<Index>) -> NSRange {
        NSRange(range, in: self)
    }
    
    var nsRange: NSRange {
        nsRange(from: startIndex..<endIndex)
    }
    
    func range(with rng: NSRange) -> Range<StrIdx>? {
        Range(rng, in: self)
    }
    
    var range: Range<StrIdx>? {
        range(with: nsRange)
    }
}

public extension Str {
    
    func sub(_ r: CountableRange<Int>) -> Str {
        let from = r.startIndex > 0 ? index(startIndex,
                                            offsetBy: r.startIndex) : startIndex
        let to = count > r.endIndex ? index(startIndex,
                                            offsetBy: r.endIndex) : endIndex
        if from >= startIndex && to <= endIndex {
            return Str(self[from..<to])
        }
        return self
    }
    
    func sub(_ r: CountableClosedRange<Int>) -> Str {
        sub(r.lowerBound..<r.upperBound)
    }
    
    func sub(_ r: CountablePartialRangeFrom<Int>) -> Str {
        sub(r.lowerBound..<count)
    }
    
    func sub(_ r: PartialRangeThrough<Int>) -> Str {
        sub(0..<r.upperBound)
    }
}

