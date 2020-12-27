


public extension StringProtocol {
    
    /// indices.map{distance(to: $0)}
    var idxs: [Int] {
        indices.map{distance(to: $0)}
    }
    /// indices.map{distance(to: $0)}.set
    var idxSet: Set<Int> {
        idxs.set
    }
    
    func distance(of element: Element) -> Int? {
        firstIndex(of: element)?.distance(in: self)
    }
    
    func distance<S: StringProtocol>(of string: S) -> Int? {
        range(of: string)?.lowerBound.distance(in: self)
    }
}

public extension String.Index {
  
    func distance<S: StringProtocol>(in string: S) -> Int { string.distance(to: self)
    }
}



public extension Str {
    
    func occurrences(of str: Str,
                     caseSensitive: Bool = true,
                     with locale: Locale = .current) -> [Str]? {
        var s = str
        if !caseSensitive {
            s = s.lowercased(with: locale)
        }
        return lowercased(with: locale).components(separatedBy: s).sth
    }
    
    // numMatches 
    func countOccurences(from charSet: CharSet) -> Int {
        var str = self
        var count = 0
        while let rng = str.rangeOfCharacter(from: charSet) {
            str = str.replacingCharacters(in: rng, with: "")
            count += 1
        }
        return count
    }
    
    func positionOfFirstChar(from charSet: CharSet) -> Int? {
        guard let rng = rangeOfCharacter(from: charSet) else { return nil }
        return distance(from: startIndex, to: rng.lowerBound)
    }
    
    
    //MARK: - index
    
    func index(of str: Str) -> Int {
        if let rng = range(of: str) {
            return distance(from: startIndex,
                            to: rng.lowerBound)
        }
        return 0
    }
    
    //TODO: add locale to all below
    
    func index(of str: Str, from: Int) -> Int {
        let fromIndex = index(startIndex, offsetBy: from)
        let startRange = Range(uncheckedBounds: (lower: fromIndex, upper: endIndex))
        
        if let rng = range(of: str,
                           range: startRange, locale: nil) {
            return distance(from: startIndex,
                            to: rng.lowerBound)
        }
        return 0
    }
    
    // lastIndex(of str
    func index(lastOf: Str) -> Int {
        if let rng = range(of: lastOf,
                           options: .backwards,
                           range: nil, locale: nil) {
            return distance(from: startIndex,
                            to: rng.upperBound)
        }
        return 0
    }
    // lastIndex(of str
    func index(lastOf: Str, to: Int) -> Int {
        let toIndex = index(startIndex, offsetBy: to)
        let startRange = Range(uncheckedBounds: (lower: toIndex, upper: endIndex))
        if let range = range(of: lastOf,
                             range: startRange, locale: nil) {
            return distance(from: startIndex,
                            to: range.upperBound)
        }
        return 0
    }

}
